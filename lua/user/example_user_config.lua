-- use a user_config.lua file to provide your own configuration

local M = {}

-- the following two fields should not be changed beyond adding more
-- entries to the table
local b = require("null-ls").builtins
M.null_ls_sources = {
  b.formatting.autopep8,
  b.code_actions.gitsigns,
}

M.formatting_servers = {
  ["rust_analyzer"] = { "rust" },
}

M.options = {
  opt = {
    -- options
  },
}

M.autocommands = {
  inlay_hints = true,
  alpha_folding = true,
  treesitter_folds = true,
  trailing_whitespace = true,
  remember_file_state = true,
  session_saved_notification = true,
  format_on_autosave = true,
  css_colorizer = true,
  activate_neotree = true,
}

return M
