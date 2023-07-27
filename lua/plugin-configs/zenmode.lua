require("zen-mode").setup({
	window = {
		options = {
			signcolumn = "no",
			foldcolumn = "0",
		},
	},
	plugins = {
		tmux = { enabled = true },
		twilight = { enabled = true },
	},
})
