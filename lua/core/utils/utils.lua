local notif = require("notify")

local function _vim_opts(options)
	for scope, table in pairs(options) do
		for setting, value in pairs(table) do
			vim[scope][setting] = value
		end
	end
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
	require("lazy").sync({ wait = true })
	updateMason()
	vim.cmd("TSUpdate")
	notif.notify("CyberNvim updated!", "info")
end

local function _open_neotree()
	if vim.fn.argc() == 1 then
		local stat = vim.loop.fs_stat(vim.fn.argv(0))
		if stat and stat.type == "directory" then
			require("plugin-configs.neo-tree")
		end
	end
end

local function _supports_formatting()
	local clients = vim.lsp.get_active_clients()
	for _, client in ipairs(clients) do
		if client.supports_method("textDocument/formatting") then
			return true
		end
	end
	return false
end

return {
	vim_opts = _vim_opts,
	map = _map,
	create_new_file = _create_new_file,
	create_floating_terminal = _create_floating_terminal,
	updateAll = _updateAll,
	open_neotree = _open_neotree,
	supports_formatting = _supports_formatting,
}
