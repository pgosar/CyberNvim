require("lazy").setup({
	{ "joshdick/onedark.vim" },
	{ "NvChad/nvim-colorizer.lua", event = "VimEnter" },
	{
		"okuuva/auto-save.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.auto-save")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugin-configs.autopairs")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "main",
		init = require("core.utils.utils").open_neotree,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugin-configs.neo-tree")
		end,
	},
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		config = function()
			require("plugin-configs.copilot")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neoscroll")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			-- this is going to be used for keybindings
			_G.term = require("plugin-configs.toggleterm")
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("plugin-configs.alpha")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.dressing")
		end,
	},
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",

		branch = "v2",
		config = function()
			require("plugin-configs.hop")
		end,
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup()
		end,
	},
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("plugin-configs.noice")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VimEnter",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		event = { "BufReadPre", "BufNewFile" },
		branch = "v2.x",
		config = function()
			require("plugin-configs.lsp")
		end,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
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
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		config = function()
			require("plugin-configs.gitsigns")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("plugin-configs.indent-blankline")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				config = function()
					require("mason-nvim-dap").setup()
				end,
			},
		},
	},
	{ "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.lualine")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugin-configs.null-ls")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
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
		"tiagovla/scope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.scope")
		end,
	},
	{ "fedepujol/move.nvim", event = "VeryLazy" },
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		config = function()
			require("plugin-configs.bufferline")
		end,
	},
	{
		"kylechui/nvim-surround",
		cmd = "VimEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		config = function()
			require("plugin-configs.aerial")
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("plugin-configs.zenmode")
		end,
	},
	{
		"folke/twilight.nvim",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("plugin-configs.twilight")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
         build --config Release && cmake --install build --prefix build",
			},
			{ "desdic/telescope-rooter.nvim" },
		},
		config = function()
			require("plugin-configs.telescope")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-configs.which-key")
		end,
	},
	{
		"Shatur/neovim-session-manager",
		event = "VimEnter",
		config = function()
			require("plugin-configs.session")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin-configs.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup()
				end,
			},
			{ "windwp/nvim-ts-autotag" },
			{ "HiPhish/nvim-ts-rainbow2" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
}, {
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})
