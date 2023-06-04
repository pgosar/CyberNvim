local client_notifs = {}

local function get_notif_data(client_id, token)
 if not client_notifs[client_id] then
   client_notifs[client_id] = {}
 end

 if not client_notifs[client_id][token] then
   client_notifs[client_id][token] = {}
 end

 return client_notifs[client_id][token]
end


local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
 local notif_data = get_notif_data(client_id, token)

 if notif_data.spinner then
   local new_spinner = (notif_data.spinner + 1) % #spinner_frames
   notif_data.spinner = new_spinner

   notif_data.notification = vim.notify(nil, nil, {
     hide_from_history = true,
     icon = spinner_frames[new_spinner],
     replace = notif_data.notification,
   })

   vim.defer_fn(function()
     update_spinner(client_id, token)
   end, 100)
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
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
             vim.notify(method.message, severity[params.type])
end
local dap = require('dap')
dap.listeners.before['event_progressStart']['progress-notifications'] = function(session, body)
 local notif_data = get_notif_data("dap", body.progressId)

 local message = format_message(body.message, body.percentage)
 notif_data.notification = vim.notify(message, "info", {
   title = format_title(body.title, session.config.type),
   icon = spinner_frames[1],
   timeout = false,
   hide_from_history = false,
 })

 notif_data.notification.spinner = 1,
 update_spinner("dap", body.progressId)
end

dap.listeners.before['event_progressUpdate']['progress-notifications'] = function(session, body)
 local notif_data = get_notif_data("dap", body.progressId)
 notif_data.notification = vim.notify(format_message(body.message, body.percentage), "info", {
   replace = notif_data.notification,
   hide_from_history = false,
 })
end

dap.listeners.before['event_progressEnd']['progress-notifications'] = function(session, body)
 local notif_data = client_notifs["dap"][body.progressId]
 notif_data.notification = vim.notify(body.message and format_message(body.message) or "Complete", "info", {
    icon = "",
    replace = notif_data.notification,
    timeout = 3000
 })
 notif_data.spinner = nil
end
