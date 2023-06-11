local session = require("session_manager")
local conf = require("session_manager.config")

session.setup({
  autosave_only_in_session = true,
  autoload_mode = conf.AutoloadMode.Disabled
})
