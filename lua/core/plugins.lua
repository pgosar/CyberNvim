local enabled = require("core.utils.utils").enabled

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local plugins = exist and type(user_config) == "table" and user_config.plugins or {}

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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
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
		"lvimuser/lsp-inlayhints.nvim",
		cond = enabled(group, "inlay_hints"),
		event = "VeryLazy",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
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
		"nacro90/numb.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		cond = enabled(group, "noice"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.noice")
		end,
		dependencies = {  "MunifTanjim/nui.nvim"  },
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
		"hrsh7th/nvim-cmp",
		cond = enabled(group, "cmp"),
		event = "InsertEnter",
		config = function()
			require("plugin-configs.cmp")
		end,
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"Dosx001/cmp-commit",
			"KadoBOT/cmp-plugins",
			"chrisgrieser/cmp-nerdfont",
			"chrisgrieser/cmp_yanky",
			"dmitmel/cmp-cmdline-history",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"lukas-reineke/cmp-rg",
			"mireq/luasnip-snippets",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
			{
				"Dynge/gitmoji.nvim",
				opts = {},
			},
			{
				"petertriho/cmp-git",
				lazy = true,
				config = function()
					require("plugin-configs.cmp-git")
				end,
			},
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
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
	'rcasia/neotest-bash',
  }
},
	{
		"mfussenegger/nvim-dap",
		cond = enabled(group, "dap"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.dap")
		end,
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				config = function()
					require("plugin-configs.mason-nvim-dap")
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
				opts = {},
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				--NOTE:library
				"nvim-neotest/nvim-nio",
			},
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					require("dap-python").setup("~/.venv/debugpy/bin/python")
				end,
			},
		},
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
		"jsongerber/thanks.nvim",
		opts = {
			plugin_manager = "lazy",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cond = enabled(group, "telescope"),
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
				build --config Release && cmake --install build --prefix build",
				"debugloop/telescope-undo.nvim",
			},
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
		"NvChad/nvim-colorizer.lua",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			opts = {
				color_icons = true,
				default = true,
				strict = true,
			},
		},
		cmd = { "TroubleToggle", "Trouble" },
		cond = enabled(group, "trouble"),
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
	{
		"gbprod/yanky.nvim",
		config = function()
			require("plugin-configs.yanky")
		end,
	},
	{
		"chentoast/marks.nvim",
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
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.lualine")
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"roobert/action-hints.nvim",
		opts = {},
	},
	plugins,
}, {
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})
