for _, source in ipairs {
  "core.utils.utils", "core.autocommands", "core.main-options",
  "core.plugins", "core.keybindings", "core.utils.notify"

} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end

require("neodev").setup()
require('Comment').setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('plugin-configs.null-ls')

require('bufferline').setup {}
require('scope').setup {}

vim.cmd([[ colorscheme onedark ]])

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.notify = require("notify")
