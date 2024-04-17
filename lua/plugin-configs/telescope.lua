local telescope = require("telescope")
telescope.setup({
	extensions = {
		undo = {
			i = {
				["<cr>"] = require("telescope-undo.actions").yank_additions,
				["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
				["<C-cr>"] = require("telescope-undo.actions").restore,
				-- alternative defaults, for users whose terminals do questionable things with modified <cr>
				["<C-y>"] = require("telescope-undo.actions").yank_deletions,
				["<C-r>"] = require("telescope-undo.actions").restore,
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
})
telescope.load_extension("aerial")
telescope.load_extension("find_template")
telescope.load_extension("noice")
telescope.load_extension("notify")
telescope.load_extension("scope")
telescope.load_extension("undo")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
