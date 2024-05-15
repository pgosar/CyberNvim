require("nvim-treesitter.configs").setup({
	highlight = { enable = true, disable = { "html" } },
	incremental_selection = { enable = true },
	autotag = { enable = true },
	rainbow = { enable = true, disable = { "html" }, extended_mode = false },
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

require("treesitter-context").setup({
	max_lines = 1,
	multiline_threshold = 2,
})

-- require('detect-language').provider.treesitter {
--   -- minimum score to be considered as candidate languages
--   minimum = 0
-- }
