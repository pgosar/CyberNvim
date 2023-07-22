local noice = require("noice")

noice.setup({
	redirect = {
		{
			view = "mini",
			filter = {
				any = {
					{ event = "msg_showmode" },
					{ find = " change" },
					{ event = "msg_history_show" },
					{ event = "msg_show", kind = "wmsg" },
					{ find = "E486" },
					{ event = "msg_showcmd" },
				},
			},
		},
		{
			view = "mini",
			filter = { event = "msg_show", kind = "", find = "written" },
		},
		{ view = "mini", filter = { event = "msg_showmode" } },
	},
	cmdline = { view = "cmdline" },
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})
