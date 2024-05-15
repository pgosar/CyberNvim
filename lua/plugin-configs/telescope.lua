local telescope = require("telescope")
telescope.setup({
	extensions = {
		undo = {
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
					["<C-cr>"] = require("telescope-undo.actions").restore,
				},
				n = {
					["y"] = require("telescope-undo.actions").yank_additions,
					["Y"] = require("telescope-undo.actions").yank_deletions,
					["u"] = require("telescope-undo.actions").restore,
				},
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
		},
		hop = {
			-- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
			-- Highlight groups to link to signs and lines; the below configuration refers to demo
			-- sign_hl typically only defines foreground to possibly be combined with line_hl
			sign_hl = { "WarningMsg", "Title" },
			-- optional, typically a table of two highlight groups that are alternated between
			line_hl = { "CursorLine", "Normal" },
			-- options specific to `hop_loop`
			-- true temporarily disables Telescope selection highlighting
			clear_selection_hl = false,
			-- highlight hopped to entry with telescope selection highlight
			-- note: mutually exclusive with `clear_selection_hl`
			trace_entry = true,
			-- jump to entry where hoop loop was started from
			reset_selection = true,
		},
		neoclip = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				edit = "<c-e>", -- edit an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = "P",
				replay = "q",
				delete = "d",
				edit = "e",
			},
		},
	},
})
telescope.load_extension("aerial")
telescope.load_extension("conflicts")
telescope.load_extension("frecency")
telescope.load_extension("fzf")
telescope.load_extension("hop")
telescope.load_extension("noice")
telescope.load_extension("notify")
telescope.load_extension("scope")
telescope.load_extension("undo")
