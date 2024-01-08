local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

for _, source in ipairs({
	"core.main-options",
	"core.plugins",
	"core.keybindings",
	"core.utils.utils",
	"core.autocommands",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end
local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
if require("core.utils.utils").enabled(group, "notify") then
	vim.notify = require("notify")
end

vim.api.nvim_create_user_command("CyberUpdate", function()
	require("core.utils.utils").update_all()
end, { desc = "Updates plugins, mason packages, treesitter parsers" })

vim.cmd("colorscheme onedark")

if exist and type(user_config) == "table" and user_config.user_conf then
	user_config.user_conf()
end
