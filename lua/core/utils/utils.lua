-- luacheck: globals vim

local notif = require("notify")

local function _vim_opts(options)
	for scope, table in pairs(options) do
		for setting, value in pairs(table) do
			vim[scope][setting] = value
		end
	end
end

local _ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local function _map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function _create_new_file()
	local filename = vim.fn.input("Enter the filename: ")
	if filename ~= "" then
		vim.cmd("edit " .. filename)
	end
end

local function _create_floating_terminal(cmd)
	local instance = nil
	if vim.fn.executable(cmd) == 1 then
		local terminal = require("toggleterm.terminal").Terminal
		instance = terminal:new({
			cmd = cmd,
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			on_open = function()
				vim.cmd("startinsert!")
			end,
			on_close = function()
				vim.cmd("startinsert!")
			end,
		})
	end
	return function()
		if vim.fn.executable(cmd) == 1 then
			instance:toggle()
		else
			notif.notify("Command not found: " .. cmd .. ". Ensure it is installed.", "error")
		end
	end
end

local function updateMason()
	local registry = require("mason-registry")
	registry.refresh()
	registry.update()
	local packages = registry.get_all_packages()
	for _, pkg in ipairs(packages) do
		if pkg:is_installed() then
			pkg:install()
		end
	end
end

local function _updateAll()
	vim.cmd("PackerSync")
	updateMason()
	vim.cmd("TSUpdate")
	notif.notify("CyberNvim updated!", "info")
end

return {
	vim_opts = _vim_opts,
	ensure_packer = _ensure_packer,
	map = _map,
	create_new_file = _create_new_file,
	create_floating_terminal = _create_floating_terminal,
	updateAll = _updateAll,
}
