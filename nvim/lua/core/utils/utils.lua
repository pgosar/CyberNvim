-- luacheck: globals vim

local function vim_opts(options)
	for scope, table in pairs(options) do
		for setting, value in pairs(table) do
			vim[scope][setting] = value
		end
	end
end

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function create_new_file()
	local filename = vim.fn.input("Enter the filename: ")
	if filename ~= "" then
		vim.cmd("edit " .. filename)
	end
end

return {
	vim_opts = vim_opts,
	ensure_packer = ensure_packer,
	map = map,
	create_new_file = create_new_file,
}
