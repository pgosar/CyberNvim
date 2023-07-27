-- luacheck: globals vim

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
local create_floating_terminal = require("core.utils.utils").create_floating_terminal

local _lazygit_toggle = create_floating_terminal("lazygit")
local _gdu_toggle = create_floating_terminal("gdu")
local _bashtop_toggle = create_floating_terminal("bashtop")

return {
	lazygit_toggle = _lazygit_toggle,
	gdu_toggle = _gdu_toggle,
	bashtop_toggle = _bashtop_toggle,
}
