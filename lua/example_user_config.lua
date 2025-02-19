-- use a user/user_config.lua file to provide your own configuration

local M = {}

-- add any null-ls sources you want here
M.setup_sources = function(b)
	return {
		b.formatting.autopep8,
		b.code_actions.gitsigns,
	}
end

-- add mason sources to auto-install
M.mason_ensure_installed = {
	null_ls = {
		"stylua",
		"jq",
	},
	dap = {
		"python",
		"delve",
	},
}

-- add servers to be used for auto formatting here
M.formatting_servers = {
	["rust_analyzer"] = { "rust" },
	["lua_ls"] = { "lua" },
	["null_ls"] = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
}

-- options you put here will override or add on to the default options
M.options = {
	opt = {
		confirm = true,
	},
}

-- Set any to false that you want disabled in here.
-- take a look at the autocommands file in lua/core for more information
-- Default value is true if left blank
M.autocommands = {
	alpha_folding = true,
	treesitter_folds = true,
	trailing_whitespace = true,
	remember_file_state = true,
	session_saved_notification = true,
	css_colorizer = true,
	cmp = true,
}

-- set to false to disable plugins
-- Default value is true if left blank
M.enable_plugins = {
	-- aerial: Code outline window for skimming and quick navigation
	-- https://github.com/stevearc/aerial.nvim
	aerial = false,
	
	-- alpha: Customizable start screen for Neovim
	-- https://github.com/goolord/alpha-nvim
	alpha = false,
	
	-- autotag: Automatically close and rename HTML/XML tags
	-- https://github.com/windwp/nvim-ts-autotag
	autotag = false,
	
	-- bufferline: Snazzy buffer line for Neovim
	-- https://github.com/akinsho/bufferline.nvim
	bufferline = false,
	
	-- context: Shows the current function context in the command line
	-- https://github.com/wellle/context.vim
	context = false,
	
	-- copilot: AI-powered code completion and suggestion
	-- https://github.com/github/copilot.vim
	copilot = false,
	
	-- dressing: Improve the default Neovim UI
	-- https://github.com/stevearc/dressing.nvim
	dressing = false,
	
	-- gitsigns: Git signs in the sign column
	-- https://github.com/lewis6991/gitsigns.nvim
	gitsigns = false,
	
	-- hop: Easy motion-like navigation
	-- https://github.com/phaazon/hop.nvim
	hop = false,
	
	-- img_clip: Paste images from clipboard into Neovim
	-- https://github.com/ekickx/clipboard-image.nvim
	img_clip = false,
	
	-- indent_blankline: Indentation guides for Neovim
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	indent_blankline = false,
	
	-- lsp_zero: Lightweight LSP configuration for Neovim
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	lsp_zero = false,
	
	-- lualine: Fast and easy-to-configure statusline
	-- https://github.com/nvim-lualine/lualine.nvim
	lualine = false,
	
	-- neodev: Neovim setup for init.lua and plugin development
	-- https://github.com/folke/neodev.nvim
	neodev = false,
	
	-- neoscroll: Smooth scrolling for Neovim
	-- https://github.com/karb94/neoscroll.nvim
	neoscroll = false,
	
	-- neotree: File explorer tree for Neovim
	-- https://github.com/nvim-neo-tree/neo-tree.nvim
	neotree = false,
	
	-- session_manager: Session management for Neovim
	-- https://github.com/Shatur/neovim-session-manager
	session_manager = false,
	
	-- noice: Highly experimental plugin that replaces UI components
	-- https://github.com/folke/noice.nvim
	noice = false,
	
	-- null_ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	null_ls = false,
	
	-- autopairs: Autopairs for Neovim
	-- https://github.com/windwp/nvim-autopairs
	autopairs = false,
	
	-- cmp: Completion engine for Neovim
	-- https://github.com/hrsh7th/nvim-cmp
	cmp = false,
	
	-- colorizer: Color highlighter for Neovim
	-- https://github.com/norcalli/nvim-colorizer.lua
	colorizer = false,
	
	-- dap: Debug Adapter Protocol client implementation for Neovim
	-- https://github.com/mfussenegger/nvim-dap
	dap = false,
	
	-- notify: Fancy, configurable notification manager for Neovim
	-- https://github.com/rcarriga/nvim-notify
	notify = false,
	
	-- surround: Surround selections, stylishly
	-- https://github.com/kylechui/nvim-surround
	surround = false,
	
	-- treesitter: Nvim Treesitter configurations and abstraction layer
	-- https://github.com/nvim-treesitter/nvim-treesitter
	treesitter = false,
	
	-- ufo: Folding powered by lsp, treesitter and more
	-- https://github.com/kevinhwang91/nvim-ufo
	ufo = false,
	
	-- onedark: One Dark theme for Neovim
	-- https://github.com/navarasu/onedark.nvim
	onedark = false,
	
	-- project: Project management for Neovim
	-- https://github.com/ahmedkhalf/project.nvim
	project = false,
	
	-- rainbow: Rainbow parentheses for Neovim
	-- https://github.com/p00f/nvim-ts-rainbow
	rainbow = false,
	
	-- scope: Visualize and search Treesitter scopes
	-- https://github.com/tiagovla/scope.nvim
	scope = false,
	
	-- telescope: Highly extendable fuzzy finder over lists
	-- https://github.com/nvim-telescope/telescope.nvim
	telescope = false,
	
	-- toggleterm: Persist and toggle multiple terminals
	-- https://github.com/akinsho/toggleterm.nvim
	toggleterm = false,
	
	-- trouble: Pretty diagnostics, references, telescope results, quickfix and location list
	-- https://github.com/folke/trouble.nvim
	trouble = false,
	
	-- twilight: Dim inactive portions of the code you're editing
	-- https://github.com/folke/twilight.nvim
	twilight = false,
	
	-- whichkey: Displays a popup with possible keybindings of the command you started typing
	-- https://github.com/folke/which-key.nvim
	whichkey = false,
	
	-- windline: Animations for Neovim's statusline
	-- https://github.com/windwp/windline.nvim
	windline = false,
	
	-- zen: Distraction-free coding for Neovim
	-- https://github.com/folke/zen-mode.nvim
	zen = false,
}

-- add extra plugins in here
M.plugins = {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
}

M.lsp_config = {
	clangd = {},
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.user_conf = function()
	vim.cmd([[
  autocmd VimEnter * lua vim.notify("Welcome to CyberNvim!", "info", {title = "Neovim"})]])
	-- require("user.autocmds")
	-- vim.cmd("colorscheme elflord")
end

return M
