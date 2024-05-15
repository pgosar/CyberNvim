local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=main",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

for _, source in ipairs({
	"core.main-options",
	"core.plugins",
	"core.keybindings",
	"core.utils",
	"core.autocommands",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln(" 載入失敗 " .. source .. "\n\n" .. fault)
	end
end
local group = {}

require("plugin-configs.lsp-zero")
require("plugin-configs.mason")
require("plugin-configs.notify")
HOME_PATH = os.getenv("HOME") .. "/"
MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"

if require("core.utils").enabled(group, "notify") then
	vim.notify = require("notify")
end
