-- use a user_config.lua file to provide your own configuration

local M = {}

-- the following two fields should not be changed beyond adding more
-- entries to the table
local b = require("null-ls").builtins
M.null_ls_sources = {
  b.formatting.autopep8,
  b.code_actions.gitsigns,
}

M.null_ls_ensure_installed = {
  "stylua",
  "jq"
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

-- set to false to disable plugins
M.enable_plugins = {
  aerial = true,
  alpha = true,
  autosave = true,
  bufferline = true,
  comment = true,
  copilot = true,
  dressing = true,
  gitsigns = true,
  hop = true,
  indent_blankline = true,
  inlay_hints = true,
  lsp_zero = true,
  lualine = true,
  neodev = true,
  neoscroll = true,
  neotree = true,
  session_manager = true,
  noice = true,
  null_ls = true,
  autopairs = true,
  cmp = true,
  colorizer = true,
  dap = true,
  notify = true,
  surround = true,
  treesitter = true,
  ufo = true,
  onedark = true,
  project = true,
  scope = true,
  telescope = true,
  toggleterm = true,
  trouble = true,
  twilight = true,
  whichkey = true,
  zen = true,
}
M.plugins = {
  -- add plugins
}

-- space for any extra configuration you want
M.general = {
  vim.cmd([[
  autocmd VimEnter * lua vim.notify("Welcome to cybernvim", "info", {title = "Neovim"})
]])
}

return M
