return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("joshdick/onedark.vim")
	use("lewis6991/impatient.nvim")
	use("windwp/nvim-ts-autotag")
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"okuuva/auto-save.nvim",
		config = function()
			require("plugin-configs.auto-save")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugin-configs.autopairs")
		end,
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "main",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugin-configs.neo-tree")
		end,
	})
	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	})
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		requires = {
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		config = function()
			require("plugin-configs.copilot")
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("plugin-configs.neoscroll")
		end,
	})
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("plugin-configs.toggleterm")
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("plugin-configs.alpha")
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("plugin-configs.dressing")
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("plugin-configs.hop")
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({})
		end,
	})
	use({
		"folke/noice.nvim",
		config = function()
			require("plugin-configs.noice")
		end,
	})
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({})
		end,
	})
	use({
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup({})
		end,
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin-configs.indent-blankline")
		end,
	})
	use("mfussenegger/nvim-dap")
	use({
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({})
		end,
	})
	use("folke/trouble.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugin-configs.lualine")
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({})
		end,
	})
	use("onsails/lspkind.nvim")
	use({
		"tiagovla/scope.nvim",
		config = function()
			require("plugin-configs.scope")
		end,
	})
	use({ "fedepujol/move.nvim" })
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("plugin-configs.bufferline")
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("plugin-configs.aerial")
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("plugin-configs.zenmode")
		end,
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("plugin-configs.twilight")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
         build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			require("plugin-configs.telescope")
		end,
	})
	use("desdic/telescope-rooter.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugin-configs.which-key")
		end,
	})
	use("HiPhish/nvim-ts-rainbow2")
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("plugin-configs.session")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin-configs.treesitter")
		end,
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({})
		end,
	})
end)
