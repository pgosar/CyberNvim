-- luacheck: globals vim

local terminal = require("toggleterm")

terminal.setup({
	open_mapping = [[<c-t>]],
	on_open = function(_term)
		vim.cmd("startinsert!")
	end,
	on_close = function(_term)
		vim.cmd("startinsert!")
	end,
	size = 25,
	direction = "horizontal",
	float_opts = {
		border = "curved",
		winblend = 6,
	},
})

local terminal = require("toggleterm.terminal").Terminal

local lazygit = terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	on_open = function(_term)
		vim.cmd("startinsert!")
	end,
	on_close = function(_term)
		vim.cmd("startinsert!")
	end,
})

local function _lazygit_toggle()
	lazygit:toggle()
end

return {
	lazygit_toggle = _lazygit_toggle,
}
