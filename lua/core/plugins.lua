local enabled = require("core.utils.utils").enabled
local group = require("user.user_config").enable_plugins
require("lazy").setup({
	{ "ellisonleao/gruvbox.nvim" },
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
		"okuuva/auto-save.nvim",
		cond = enabled(group, "autosave"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.auto-save")
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
		"numToStr/Comment.nvim",
		cond = enabled(group, "comment"),
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cond = enabled(group, "copilot"),
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
		"phaazon/hop.nvim",
		cond = enabled(group, "hop"),
		event = "VimEnter",
		branch = "v2",
		config = function()
			require("plugin-configs.hop")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = enabled(group, "indent_blankline"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.indent-blankline")
		end,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		cond = enabled(group, "inlay_hints"),
		event = "VeryLazy",
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		cond = enabled(group, "lsp_zero"),
		event = { "BufReadPre", "BufNewFile" },
		branch = "v2.x",
		config = function()
			require("plugin-configs.lsp")
		end,
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				config = function()
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.offsetEncoding = { "utf-16" }
					require("lspconfig").clangd.setup({ capabilities = capabilities })
				end,
			},
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		cond = enabled(group, "lualine"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.lualine")
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
		cmd = "Neotree",
		config = function()
			require("plugin-configs.neo-tree")
		end,
		branch = "v3.x",
		init = require("core.utils.utils").open_neotree,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
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
	},
	{ "MunifTanjim/nui.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
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
				config = function()
					require("mason-nvim-dap").setup()
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
		},
	},
	{
		"rcarriga/nvim-notify",
		cond = enabled(group, "notify"),
		lazy = false,
		config = function()
			require("plugin-configs.notify")
		end,
	},
	{
		"kylechui/nvim-surround",
		cond = enabled(group, "surround"),
		cmd = "VimEnter",
		config = function()
			require("nvim-surround").setup()
		end,
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
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup()
				end,
			},
			{ "windwp/nvim-ts-autotag" },
			{ "HiPhish/rainbow-delimiters.nvim" },
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
		"joshdick/onedark.vim",
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
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
         build --config Release && cmake --install build --prefix build",
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
			-- this is going to be used for keybindings
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
			require("plugin-configs.which-key")
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
	require("user.user_config").plugins,
}, {
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})
