require("lazy").setup({
	{ "joshdick/onedark.vim" },
	{ "lewis6991/impatient.nvim" },
	{ "NvChad/nvim-colorizer.lua" },
	{
		"okuuva/auto-save.nvim",
		config = function()
			require("plugin-configs.auto-save")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugin-configs.autopairs")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "main",
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
		config = function()
			require("plugin-configs.neoscroll")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugin-configs.toggleterm")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugin-configs.alpha")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugin-configs.dressing")
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("plugin-configs.hop")
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup()
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("plugin-configs.noice")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		config = function()
			require("plugin-configs.lsp")
		end,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{
				"hrsh7th/nvim-cmp",
				config = function()
					require("plugin-configs.cmp")
				end,
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin-configs.indent-blankline")
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup()
		end,
	},
	{ "folke/trouble.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugin-configs.lualine")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugin-configs.null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("plugin-configs.mason-null-ls")
		end,
	},
	{ "onsails/lspkind.nvim" },
	{
		"tiagovla/scope.nvim",
		config = function()
			require("plugin-configs.scope")
		end,
	},
	{ "fedepujol/move.nvim" },
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugin-configs.bufferline")
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = function()
			require("plugin-configs.aerial")
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("plugin-configs.zenmode")
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("plugin-configs.twilight")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
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
		config = function()
			require("plugin-configs.which-key")
		end,
	},
	{
		"Shatur/neovim-session-manager",
		config = function()
			require("plugin-configs.session")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
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
}, {})
