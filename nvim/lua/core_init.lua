-- luacheck: globals vim

for _, source in ipairs({
	"core.utils.utils",
	"core.autocommands",
	"core.main-options",
	"core.plugins",
	"core.lsp",
	"core.keybindings",
	"core.utils.notify",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

vim.cmd([[ colorscheme onedark ]])

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.notify = require("notify")
