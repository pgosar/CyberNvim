require("lualine").setup({
	options = {
		theme = "gruvbox-material",
		globalstatus = false,
		disabled_filetypes = { statusline = { "alpha" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diagnostics" },
		lualine_c = {
			{
				"filename",
				symbols = {
					modified = "󰐖", -- Text to show when the buffer is modified
					readonly = "󰌾", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "󰜣", -- Text to show for unnamed buffers.
					newfile = "󰎜", -- Text to show for newly created file before first write
					alternate_file = "#", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},

		lualine_x = { "fileformat", "filetype" },
		lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 0 } } },
		lualine_z = { "diff", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "filesize" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "lazy", "fugitive", "trouble", "nvim-tree" },
})
