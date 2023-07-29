local sign_def = vim.fn.sign_define
require("neo-tree").setup({
	sign_def("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" }),
	sign_def("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" }),
	sign_def("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" }),
	sign_def("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" }),
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	use_libuv_file_watcher = true,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sort_case_insensitive = false,
	default_component_configs = {
		container = { enable_character_fade = true },
		indent = {
			indent_size = 2,
			padding = 2,
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
		},
		modified = { symbol = "[+]", highlight = "NeoTreeModified" },
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added = "✚",
				modified = "",
				deleted = "✖",
				renamed = "[-]",
				untracked = "",
				ignored = "",
				unstaged = "!",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		position = "left",
		width = 30,
		mappings = {
			["C"] = "close_all_subnodes",
			["Z"] = "expand_all_nodes",
			["<tab>"] = function(state)
				state.commands["open"](state)
				vim.cmd("Neotree reveal")
			end,
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
		},
		follow_current_file = {
			enabled = true,
		},
		hijack_netrw_behavior = "open_current",
	},
})
