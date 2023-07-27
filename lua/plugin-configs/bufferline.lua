require("bufferline").setup({
	options = {
		indicator = {
			style = "underline",
			icon = "",
		},
		diagnostics = "nvim_lsp",
		move_wraps_at_ends = true,
		separator_style = "slant",
	},
})
