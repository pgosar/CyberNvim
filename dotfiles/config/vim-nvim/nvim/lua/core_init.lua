for _, source in ipairs {
	"core.utils.utils",
  "core.autocommands",
	"core.main-options",
	"core.plugins",

} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

pcall(vim.cmd, 'colorscheme onedark')


