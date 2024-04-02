require("modicator").setup({
	-- Warn if any required option is missing. May emit false positives if some
	-- other plugin modifies them, which in that case you can just ignore
	show_warnings = false,
	highlights = {
		-- Default options for bold/italic
		defaults = {
			bold = true,
			italic = true,
		},
	},
	integration = {
		lualine = {
			enabled = true,
			-- Letter of lualine section to use (if `nil`, gets detected automatically)
			mode_section = nil,
			-- Whether to use lualine's mode highlight's foreground or background
			highlight = "bg",
		},
	},
})
