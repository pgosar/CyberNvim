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
	aerial = true,
	
	-- alpha: Customizable start screen for Neovim
	-- https://github.com/goolord/alpha-nvim
	alpha = true,
	
	-- autotag: Automatically close and rename HTML/XML tags
	-- https://github.com/windwp/nvim-ts-autotag
	autotag = true,
	
	-- bufferline: Snazzy buffer line for Neovim
	-- https://github.com/akinsho/bufferline.nvim
	bufferline = true,
	
	-- context: Shows the current function context in the command line
	-- https://github.com/wellle/context.vim
	context = true,
	
	-- copilot: AI-powered code completion and suggestion
	-- https://github.com/github/copilot.vim
	copilot = true,
	
	-- dressing: Improve the default Neovim UI
	-- https://github.com/stevearc/dressing.nvim
	dressing = true,
	
	-- gitsigns: Git signs in the sign column
	-- https://github.com/lewis6991/gitsigns.nvim
	gitsigns = true,
	
	-- hop: Easy motion-like navigation
	-- https://github.com/phaazon/hop.nvim
	hop = true,
	
	-- img_clip: Paste images from clipboard into Neovim
	-- https://github.com/ekickx/clipboard-image.nvim
	img_clip = true,
	
	-- indent_blankline: Indentation guides for Neovim
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	indent_blankline = true,
	
	-- lsp_zero: Lightweight LSP configuration for Neovim
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	lsp_zero = true,
	
	-- lualine: Fast and easy-to-configure statusline
	-- https://github.com/nvim-lualine/lualine.nvim
	lualine = true,
	
	-- neodev: Neovim setup for init.lua and plugin development
	-- https://github.com/folke/neodev.nvim
	neodev = true,
	
	-- neoscroll: Smooth scrolling for Neovim
	-- https://github.com/karb94/neoscroll.nvim
	neoscroll = true,
	
	-- neotree: File explorer tree for Neovim
	-- https://github.com/nvim-neo-tree/neo-tree.nvim
	neotree = true,
	
	-- session_manager: Session management for Neovim
	-- https://github.com/Shatur/neovim-session-manager
	session_manager = true,
	
	-- noice: Highly experimental plugin that replaces UI components
	-- https://github.com/folke/noice.nvim
	noice = true,
	
	-- null_ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	null_ls = true,
	
	-- autopairs: Autopairs for Neovim
	-- https://github.com/windwp/nvim-autopairs
	autopairs = true,
	
	-- cmp: Completion engine for Neovim
	-- https://github.com/hrsh7th/nvim-cmp
	cmp = true,
	
	-- colorizer: Color highlighter for Neovim
	-- https://github.com/norcalli/nvim-colorizer.lua
	colorizer = true,
	
	-- dap: Debug Adapter Protocol client implementation for Neovim
	-- https://github.com/mfussenegger/nvim-dap
	dap = true,
	
	-- notify: Fancy, configurable notification manager for Neovim
	-- https://github.com/rcarriga/nvim-notify
	notify = true,
	
	-- surround: Surround selections, stylishly
	-- https://github.com/kylechui/nvim-surround
	surround = true,
	
	-- treesitter: Nvim Treesitter configurations and abstraction layer
	-- https://github.com/nvim-treesitter/nvim-treesitter
	treesitter = true,
	
	-- ufo: Folding powered by lsp, treesitter and more
	-- https://github.com/kevinhwang91/nvim-ufo
	ufo = true,
	
	-- onedark: One Dark theme for Neovim
	-- https://github.com/navarasu/onedark.nvim
	onedark = true,
	
	-- project: Project management for Neovim
	-- https://github.com/ahmedkhalf/project.nvim
	project = true,
	
	-- rainbow: Rainbow parentheses for Neovim
	-- https://github.com/p00f/nvim-ts-rainbow
	rainbow = true,
	
	-- scope: Visualize and search Treesitter scopes
	-- https://github.com/tiagovla/scope.nvim
	scope = true,
	
	-- telescope: Highly extendable fuzzy finder over lists
	-- https://github.com/nvim-telescope/telescope.nvim
	telescope = true,
	
	-- toggleterm: Persist and toggle multiple terminals
	-- https://github.com/akinsho/toggleterm.nvim
	toggleterm = true,
	
	-- trouble: Pretty diagnostics, references, telescope results, quickfix and location list
	-- https://github.com/folke/trouble.nvim
	trouble = true,
	
	-- twilight: Dim inactive portions of the code you're editing
	-- https://github.com/folke/twilight.nvim
	twilight = true,
	
	-- whichkey: Displays a popup with possible keybindings of the command you started typing
	-- https://github.com/folke/which-key.nvim
	whichkey = true,
	
	-- windline: Animations for Neovim's statusline
	-- https://github.com/windwp/windline.nvim
	windline = true,
	
	-- zen: Distraction-free coding for Neovim
	-- https://github.com/folke/zen-mode.nvim
	zen = true,
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
