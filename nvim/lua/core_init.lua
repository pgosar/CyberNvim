-- luacheck: globals vim

vim.notify = require("notify")

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
		vim.notify("Failed to load " .. source .. "\n\n" .. fault, "error")
	end
end

local colorscheme = "onedark"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark"
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!", "error")
	return
end
