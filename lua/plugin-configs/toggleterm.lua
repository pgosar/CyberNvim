require("toggleterm").setup({
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

local create_floating_terminal = require("core.utils").create_floating_terminal
local term = require("toggleterm.terminal")

local M = {}
M.lazygit_toggle = create_floating_terminal(term, "lazygit")
M.btop_toggle = create_floating_terminal(term, "btop")

return M
