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
		lazy = false,
		config = function()
			require("plugin-configs.alpha")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		cond = enabled(group, "bufferline"),
		lazy = false,
		config = function()
			require("plugin-configs.bufferline")
		end,
	},
	{
		"stevearc/dressing.nvim",
		cond = enabled(group, "dressing"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.dressing")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		cond = enabled(group, "gitsigns"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.gitsigns")
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
		"HakonHarnes/img-clip.nvim",
		cond = enabled(group, "img_clip"),
		event = "BufEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = enabled(group, "indent_blankline"),
		event = "VimEnter",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		cond = enabled(group, "lsp_zero"),
		event = "VimEnter",
		branch = "v3.x",
		config = function()
			require("mason").setup()
			require("plugin-configs.lsp")
		end,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
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
		"karb94/neoscroll.nvim",
		cond = enabled(group, "neoscroll"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neoscroll")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cond = enabled(group, "neotree"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neo-tree")
		end,
		branch = "v3.x",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
		dependencies = { { "MunifTanjim/nui.nvim" } },
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
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{ "NvChad/nvim-colorizer.lua", cond = enabled(group, "colorizer"), event = "VimEnter" },
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
				config = function()
					require("dapui").setup()
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup()
				end,
			},
			{
				"nvim-neotest/nvim-nio",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		cond = enabled(group, "notify"),
		lazy = false,
	},
	{
		"kylechui/nvim-surround",
		cond = enabled(group, "surround"),
		event = "VimEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cond = enabled(group, "treesitter"),
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugin-configs.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				cond = enabled(group, "context"),
				config = function()
					require("plugin-configs.treesitter-context")
				end,
			},
			{ "windwp/nvim-ts-autotag", cond = enabled(group, "autotag") },
			{ "HiPhish/rainbow-delimiters.nvim", cond = enabled(group, "rainbow") },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		cond = enabled(group, "ufo"),
		event = "VimEnter",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"navarasu/onedark.nvim",
		cond = enabled(group, "onedark"),
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"ahmedkhalf/project.nvim",
		cond = enabled(group, "project"),
		event = "VimEnter",
		config = function()
			require("project_nvim").setup()
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
		"nvim-telescope/telescope.nvim",
		cond = enabled(group, "telescope"),
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
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
		"folke/trouble.nvim",
		cond = enabled(group, "trouble"),
		cmd = { "TroubleToggle", "Trouble" },
	},
	{
		"folke/twilight.nvim",
		cond = enabled(group, "twilight"),
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("plugin-configs.twilight")
		end,
	},
	{
		"folke/which-key.nvim",
		cond = enabled(group, "whichkey"),
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"windwp/windline.nvim",
		cond = enabled(group, "windline"),
		event = "VeryLazy",
		config = function()
			require("wlsample.evil_line")
		end,
	},
	{
		"folke/zen-mode.nvim",
		cond = enabled(group, "zen"),
		cmd = "ZenMode",
		config = function()
			require("plugin-configs.zenmode")
		end,
	},
	plugins,
}, {
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})
