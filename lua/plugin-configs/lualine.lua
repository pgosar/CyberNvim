local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		theme = "gruvbox",
		globalstatus = false,
		disabled_filetypes = { statusline = { "alpha" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "b:gitsigns_head", icon = "" }, "diagnostics" },
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
			{
				"diff",
				colored = true, -- Displays a colored diff status if set to true
				symbols = { added = "󰐖 ", modified = "󰦓 ", removed = " " }, -- Changes the symbols used by the diff.
				source = diff_source,
			},
		},

		lualine_x = {
			{
				"fileformat",
				symbols = {
					unix = "",
					mac = "",
				},
			},
			"filetype",
		},
		lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 0 } } },
		lualine_z = {
			"location",
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = { "filesize" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "lazy", "fugitive", "trouble" },
})
