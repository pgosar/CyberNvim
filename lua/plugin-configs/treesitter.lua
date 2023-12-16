require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "html" },
	},
	incremental_selection = { enable = true },
	autotag = { enable = true },
	rainbow = { enable = true, disable = { "html" }, extended_mode = false },
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
