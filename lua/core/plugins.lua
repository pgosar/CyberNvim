local enabled = require("core.utils").enabled

local group = {}
local plugins = {}

require("lazy").setup({
	{
		"stevearc/aerial.nvim",
		cond = enabled(group, "aerial"),
		cmd = "AerialToggle",
		config = function()
			require("plugin-configs.aerial")
		end,
	},
	{
		"goolord/alpha-nvim",
		cond = enabled(group, "alpha"),
		config = function()
			require("plugin-configs.alpha")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		cond = enabled(group, "bufferline"),
		config = function()
			require("plugin-configs.bufferline")
		end,
	},
	{
		"numToStr/Comment.nvim",
		cond = enabled(group, "comment"),
		event = "VeryLazy",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		cond = enabled(group, "dressing"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.dressing")
		end,
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		cond = enabled(group, "hop"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.hop")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		cond = enabled(group, "lsp_zero"),
		event = "VimEnter",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		cond = enabled(group, "gitsigns"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.gitsigns")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"j-hui/fidget.nvim",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("plugin-configs.fidget")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugin-configs.lspconfig")
		end,
	},
	{
		"folke/neodev.nvim",
		cond = enabled(group, "neodev"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neodev")
		end,
	},
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin-configs.oil")
		end,
	},
	{
		"Shatur/neovim-session-manager",
		cond = enabled(group, "session_manager"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.session")
		end,
	},
	{
		"folke/noice.nvim",
		cond = enabled(group, "noice"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.noice")
		end,
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"nvimtools/none-ls.nvim",
		cond = enabled(group, "null_ls"),
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugin-configs.null-ls")
		end,
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				cmd = { "NullLsInstall", "NullLsUninstall" },
				config = function()
					require("plugin-configs.mason-null-ls")
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		cond = enabled(group, "autopairs"),
		event = "InsertEnter",
		config = function()
			require("plugin-configs.autopairs")
		end,
	},
	{
		"moyiz/command-and-cursor.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup {
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					require('hover.providers.gh')
					require('hover.providers.gh_user')
					require('hover.providers.man')
					require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = 'single'
				},
				-- Whether the contents of a currently open hover window should be moved
				-- to a :h preview-window when pressing the hover keymap.
				preview_window = false,
				title = true,
				mouse_providers = {
					'LSP'
				},
				mouse_delay = 1000
			}

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
			vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end,
				{ desc = "hover.nvim (previous source)" })
			vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end,
				{ desc = "hover.nvim (next source)" })

			-- Mouse support
			vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
			vim.o.mousemoveevent = true
		end
	},
	{
		"hrsh7th/nvim-cmp",
		cond = enabled(group, "cmp"),
		event = "InsertEnter",
		config = function()
			require("plugin-configs.cmp")
		end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"octaltree/cmp-look",
			"lukas-reineke/cmp-rg",
			"mireq/luasnip-snippets",
			"onsails/lspkind.nvim",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin-configs.hardtime")
		end,
	},
	{
		"yutkat/git-rebase-auto-diff.nvim",
		ft = { "gitrebase" },
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "benfowler/telescope-luasnip.nvim" },
		init = function()
			require("plugin-configs.luasnip")
		end,
	},
	{
		"tamton-aquib/duck.nvim",
		cond = enabled(group, "duck"),
		opts = {},
	},
	{
		"hinell/lsp-timeout.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		default_mappings = true,
	},
	{
		"rcarriga/nvim-notify",
		cond = enabled(group, "notify"),
	},
	{
		"kylechui/nvim-surround",
		cond = enabled(group, "surround"),
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cond = enabled(group, "treesitter"),
		event = { "BufReadPost", "BufNewFile" },
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin-configs.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
			"HiPhish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		cond = enabled(group, "ufo"),
		event = "VimEnter",
		dependencies = "kevinhwang91/promise-async",
		opts = {},
	},
	{
		"f4z3r/gruvbox-material.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"tiagovla/scope.nvim",
		cond = enabled(group, "scope"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.scope")
		end,
	},
	{
		"gerazov/toggle-bool.nvim",
		config = function()
			require("plugin-configs.bool")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cond = enabled(group, "telescope"),
		cmd = "Telescope",
		dependencies = {
			"AckslD/nvim-neoclip.lua",
			"Snikimonkd/telescope-git-conflicts.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-hop.nvim",
			"nvim-telescope/telescope-symbols.nvim",
		},
		config = function()
			require("plugin-configs.telescope")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cond = enabled(group, "toggleterm"),
		event = "VeryLazy",
		config = function()
			_G.term = require("plugin-configs.toggleterm")
		end,
	},
	{
		"wildfunctions/myeyeshurt",
		cond = enabled(group, "myeyeshurt"),
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin-configs.myeyeshurt")
		end,
	},
	{
		"folke/trouble.nvim",
		branch = "dev", -- IMPORTANT!
		dependencies = "nvim-tree/nvim-web-devicons",
		cond = enabled(group, "trouble"),
		opts = {},
	},
	{
		"folke/which-key.nvim",
		cond = enabled(group, "whichkey"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.which-key")
		end,
	},
	{
		"lambdalisue/suda.vim",
		cond = enabled(group, "suda"),
		config = function()
			require("plugin-configs.suda")
		end,
	},
	{
		"mawkler/modicator.nvim",
		dependencies = "f4z3r/gruvbox-material.nvim", -- Add your colorscheme plugin here
		init = function()
			require("plugin-configs.modicator")
		end,
		opts = {},
	},
	-- HACK: this looks cool
	{
		"folke/todo-comments.nvim",
		config = function()
			require("plugin-configs.todo")
		end,
	},
	{
		"linrongbin16/gitlinker.nvim",
		cond = enabled(group, "aerial"),
		lazy = false,
		cmd = "GitLink",
		opts = {},
	},
	{
		"sQVe/sort.nvim",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("plugin-configs.indentscope")
		end,
	},
	{
		"kevinhwang91/nvim-fundo",
		require = "kevinhwang91/promise-async",
		run = function()
			require("fundo").install()
			require("fundo").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("plugin-configs.escape")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"mikesmithgh/git-prompt-string-lualine.nvim",
		},
		config = function()
			require("plugin-configs.lualine")
		end,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugin-configs.markdown")
		end,
	},
	{
		"m4xshen/smartcolumn.nvim",
		config = function()
			require("plugin-configs.smartcolumn")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		"Myzel394/easytables.nvim",
		"dstein64/nvim-scrollview",
		"f-person/git-blame.nvim",
		"jghauser/mkdir.nvim",
		"jsongerber/thanks.nvim",
		"lambdalisue/suda.vim",
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
		"tpope/vim-sleuth",
		{ "NvChad/nvim-colorizer.lua",     opts = {} },
		{ "briangwaltney/paren-hint.nvim", opts = {} },
		{ "chentoast/marks.nvim",          opts = {} },
		{ "nacro90/numb.nvim",             opts = {} },
		{ "roobert/action-hints.nvim",     opts = {} },
		{ "spywhere/detect-language.nvim", opts = {} },
		{ "tzachar/highlight-undo.nvim",   opts = {} },
		{ "yamatsum/nvim-cursorline",      opts = {} },
	},

}, {
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})
