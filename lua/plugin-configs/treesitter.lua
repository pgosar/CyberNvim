require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	incremental_selection = { enable = true },
	autotag = { enable = true },
	rainbow = { enable = true, disable = { "html" }, extended_mode = false },
})
