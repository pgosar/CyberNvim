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

-- table from lsp severity to vim severity.
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
        notif_data.notification = vim.notify(message, 1, {
            title = format_title(body.title, session.config.type),
            icon = spinner_frames[1],
            timeout = false,
            hide_from_history = false
        })

        notif_data.notification.spinner = 1, update_spinner("dap",
                                                            body.progressId)
    end

dap.listeners.before['event_progressUpdate']['progress-notifications'] =
    function(_, body)
        local notif_data = get_notif_data("dap", body.progressId)
        notif_data.notification = vim.notify(
                                      format_message(body.message,
                                                     body.percentage), 1, {
                replace = notif_data.notification,
                hide_from_history = false
            })
    end

dap.listeners.before['event_progressEnd']['progress-notifications'] = function(
    _, body)
    local notif_data = client_notifs["dap"][body.progressId]
    notif_data.notification = vim.notify(body.message and
                                             format_message(body.message) or
                                             "Complete", 1, {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000
    })
    notif_data.spinner = nil
end

local function _rename()
    local pos = vim.lsp.util.make_position_params()
    pos.oldName = vim.fn.expand("<cword>")
    vim.ui.input({prompt = 'rename to> ', default = pos.oldName},
                 function(input)
        if input == nil then return end

        pos.newName = input
        vim.lsp.buf_request(0, "textDocument/rename", pos,
                            function(err, res, ctx, config)
            vim.lsp.handlers["textDocument/rename"](err, res, ctx, config)

            local notif, entries = {}, {}
            local updates = 0

            if res.changes then
                for uri, edits in pairs(res.changes) do
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
            str = string.format('made %s', notif[1]:sub(4))
            local loc = str:find('in')

            str = table.concat({
                str:sub(1, loc - 1),
                string.format('change%s ', (updates > 1 and "s") or ""),
                str:sub(loc)
            }, '')
            vim.notify(str, 1, {
                title = string.format('[LSP] rename: %s -> %s', pos.oldName,
                                      pos.newName),
                timeout = 2500
            })
        end)
    end)
end

vim.lsp.buf.rename = _rename
