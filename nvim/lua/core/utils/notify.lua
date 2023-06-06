local client_notifs = {}

local function get_notif_data(client_id, token)
    if not client_notifs[client_id] then client_notifs[client_id] = {} end

    if not client_notifs[client_id][token] then
        client_notifs[client_id][token] = {}
    end

    return client_notifs[client_id][token]
end

local spinner_frames = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}

local function update_spinner(client_id, token)
    local notif_data = get_notif_data(client_id, token)

    if notif_data.spinner then
        local new_spinner = (notif_data.spinner + 1) % #spinner_frames
        notif_data.spinner = new_spinner

        notif_data.notification = vim.notify("", nil, {
            hide_from_history = true,
            icon = spinner_frames[new_spinner],
            replace = notif_data.notification
        })

        vim.defer_fn(function() update_spinner(client_id, token) end, 100)
    end
end

local function format_title(title, client_name)
    return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
    return (percentage and percentage .. "%\t" or "") .. (message or "")
end

local severity = {
    "error", "warn", "info", "info" -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] =
    function(_, method, params, _)
        vim.notify(method.message, severity[params.type])
    end
local dap = require('dap')
dap.listeners.before['event_progressStart']['progress-notifications'] =
    function(session, body)
        local notif_data = get_notif_data("dap", body.progressId)

        local message = format_message(body.message, body.percentage)
        notif_data.notification = vim.notify(message, "info", {
            title = format_title(body.title, session.config.type),
            icon = spinner_frames[1],
            timeout = false,
            hide_from_history = false
        })

        notif_data.notification.spinner = 1
        update_spinner("dap", body.progressId)
    end

dap.listeners.before['event_progressUpdate']['progress-notifications'] =
    function(_, body)
        local notif_data = get_notif_data("dap", body.progressId)
        notif_data.notification = vim.notify(
                                      format_message(body.message,
                                                     body.percentage), "info", {
                replace = notif_data.notification,
                hide_from_history = false
            })
    end

dap.listeners.before['event_progressEnd']['progress-notifications'] = function(
    _, body)
    local notif_data = client_notifs["dap"][body.progressId]
    notif_data.notification = vim.notify(body.message and
                                             format_message(body.message) or
                                             "Complete", "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000
    })
    notif_data.spinner = nil
end

local function _rename()
    local param = vim.lsp.util.make_position_params()
    param.oldName = vim.fn.expand("<cword>")
    vim.ui.input({prompt = 'rename to> ', default = param.oldName},
                 function(input)
        if input == nil then
            vim.notify('aborted', "warn",
                       {title = '[LSP] rename', render = 'compact'})
            return
        end
        param.newName = input
        vim.lsp.buf_request(0, "textDocument/rename", param,
                            function(err, result, ctx, config)
            if not result or (not result.documentChanges and not result.changes) then
                vim.notify(string.format('could not perform rename: %s -> %s',
                                         param.oldName, param.newName), "error",
                           {title = '[LSP] rename', timeout = 500})

                return
            end

            vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)

            local notif, entries = {}, {}
            local files, updates = 0, 0

            if result.documentChanges then
                for _, document in pairs(result.documentChanges) do
                    files = files + 1
                    local uri = document.textDocument.uri
                    local bufnr = vim.uri_to_bufnr(uri)

                    for _, edit in ipairs(document.edits) do
                        local start_line = edit.range.start.line + 1
                        local line = vim.api.nvim_buf_get_lines(bufnr,
                                                                start_line - 1,
                                                                start_line,
                                                                false)[1]

                        table.insert(entries, {
                            bufnr = bufnr,
                            lnum = start_line,
                            col = edit.range.start.character + 1,
                            text = line
                        })
                    end

                    updates = updates + vim.tbl_count(document.edits)

                    local short_uri = string.sub(vim.uri_to_fname(uri),
                                                 #vim.loop.cwd() + 2)
                    table.insert(notif, string.format('\t- %d in %s',
                                                      vim.tbl_count(
                                                          document.edits),
                                                      short_uri))
                end
            end

            if result.changes then
                for uri, edits in pairs(result.changes) do
                    files = files + 1
                    local bufnr = vim.uri_to_bufnr(uri)

                    for _, edit in ipairs(edits) do
                        local start_line = edit.range.start.line + 1
                        local line = vim.api.nvim_buf_get_lines(bufnr,
                                                                start_line - 1,
                                                                start_line,
                                                                false)[1]

                        table.insert(entries, {
                            bufnr = bufnr,
                            lnum = start_line,
                            col = edit.range.start.character + 1,
                            text = line
                        })
                    end

                    updates = updates + vim.tbl_count(edits)

                    local short_uri = string.sub(vim.uri_to_fname(uri),
                                                 #vim.loop.cwd() + 2)
                    table.insert(notif, string.format('\t- %d in %s',
                                                      vim.tbl_count(edits),
                                                      short_uri))
                end
            end

            local str = ''
            if files > 1 then
                table.insert(notif, 1,
                             string.format('made %d change%s in %d files',
                                           updates, (updates > 1 and "s") or "",
                                           files))

                str = table.concat(notif, '\n')
            else
                str = string.format('made %s', notif[1]:sub(4))

                local insert_loc = str:find('in')
                str = table.concat({
                    str:sub(1, insert_loc - 1),
                    string.format('change%s ', (updates > 1 and "s") or ""),
                    str:sub(insert_loc)
                }, '')
            end
            vim.notify(str, "info", {
                title = string.format('[LSP] rename: %s -> %s', param.oldName,
                                      param.newName),
                timeout = 2500
            })
        end)
    end)
end
vim.lsp.buf.rename = _rename

local function _format()
    local count = 0
    local param = vim.lsp.util.make_formatting_params()
    vim.lsp.buf_request(0, "textDocument/formatting", param,
                        function(err, result, ctx, config)
        if not result then
            vim.notify('formatting failed', "error", {title = '[LSP] format'})
            return
        end
        vim.lsp.handlers["textDocument/formatting"](err, result, ctx, config)
        if count == 0 then
            local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
            vim.notify(string.format('[LSP] formatted %s', name), "info",
                       {title = '[LSP] format'})
        end
        count = count + 1
    end)
end

vim.lsp.buf.format = _format
