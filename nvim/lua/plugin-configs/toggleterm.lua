local terminal = require("toggleterm")

terminal.setup({
	open_mapping = [[<c-\>]],
	size = 25,
	direction = "horizontal",
	float_opts = {
		border = "curved",
		winblend = 6,
	},
})
