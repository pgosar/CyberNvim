local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.autocommands or {}
local plugin = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local enabled = require("core.utils.utils").enabled

-- disables code folding for the start screen
if enabled(group, "alpha_folding") then
	cmd({ "FileType" }, {
		desc = "Disable folding for alpha buffer",
		group = augroup("alpha", { clear = true }),
		pattern = "alpha",
		command = "setlocal nofoldenable",
	})
end

-- Fixes some bugs with how treesitter manages folds
if enabled(group, "treesitter_folds") then
	cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
		desc = "fix tree sitter folds issue",
		group = augroup("treesitter folds", { clear = true }),
		pattern = { "*" },
		callback = function()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	})
end

-- Removes any trailing whitespace when saving a file
if enabled(group, "trailing_whitespace") then
	cmd({ "BufWritePre" }, {
		desc = "remove trailing whitespace on save",
		group = augroup("remove trailing whitespace", { clear = true }),
		pattern = { "*" },
		command = [[%s/\s\+$//e]],
	})
end

-- remembers file state, such as cursor position and any folds
if enabled(group, "remember_file_state") then
	augroup("remember file state", { clear = true })
	cmd({ "BufWinLeave" }, {
		desc = "remember file state",
		group = "remember file state",
		pattern = { "*.*" },
		command = "mkview",
	})
	cmd({ "BufWinEnter" }, {
		desc = "remember file state",
		group = "remember file state",
		pattern = { "*.*" },
		command = "silent! loadview",
	})
end

-- gives you a notification upon saving a session
if enabled(group, "session_saved_notification") then
	cmd({ "User" }, {
		desc = "notify session saved",
		group = augroup("session save", { clear = true }),
		pattern = "SessionSavePost",
		command = "lua vim.notify('Session Saved', 'info')",
	})
end

-- enables coloring hexcodes and color names in css, jsx, etc.
if enabled(group, "css_colorizer") and enabled(plugin, "colorizer") then
	cmd({ "Filetype" }, {
		desc = "activate colorizer",
		pattern = "css,scss,html,xml,svg,js,jsx,ts,tsx,php,vue",
		group = augroup("colorizer", { clear = true }),
		callback = function()
			require("colorizer").attach_to_buffer(0, {
				mode = "background",
				css = true,
			})
		end,
	})
end

-- disables autocomplete in some filetypes
if enabled(group, "cmp") and enabled(plugin, "cmp") then
	cmd({ "FileType" }, {
		desc = "disable cmp in certain filetypes",
		pattern = "gitcommit,gitrebase,text",
		group = augroup("cmp_disable", { clear = true }),
		command = "lua require('cmp').setup.buffer { enabled = false}",
	})
end

-- fixes Trouble not closing when last window in tab
cmd("BufEnter", {
	group = vim.api.nvim_create_augroup("TroubleClose", { clear = true }),
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "Trouble"
			and layout[3] == nil
		then
			vim.cmd("confirm quit")
		end
	end,
})
