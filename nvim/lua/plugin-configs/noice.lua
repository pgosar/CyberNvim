local noice = require("noice")

noice.setup({
	messages = {
		view = "mini",
		view_search = "mini",
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
		{
			view = "notify",
			filter = {
				event = "msg_show",
				kind = "",
				find = "substitutions",
			},
		},
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
		lsp_doc_border = true,
	},
})
