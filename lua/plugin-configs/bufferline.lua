require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
