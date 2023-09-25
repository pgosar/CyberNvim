local vim_opts = require("core.utils.utils").vim_opts
vim.opt.shortmess:append({ s = true, I = true })
vim_opts({
	opt = {
		swapfile = false,
		number = true,
		signcolumn = "yes",
		numberwidth = 6,
		colorcolumn = "100",
		guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",

		expandtab = true,
		tabstop = 2,
		softtabstop = 2,
		shiftwidth = 2,

		updatetime = 100,
		linebreak = true,
		showbreak = "=>>",
		textwidth = 100,
		breakindent = true,
		breakindentopt = "shift:2,min:40,sbr",

		smartcase = true,
		ignorecase = true,

		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
		foldlevel = 99,
		foldlevelstart = 99,
		foldopen = "jump,block,hor,mark,percent,quickfix,search,tag,undo",
		foldenable = true,

		clipboard = "unnamedplus",
		scrolloff = 5,
		autowrite = true,
		confirm = true,
		autochdir = true,
		termguicolors = true,
		undofile = true,
		sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
		hidden = true,
	},
})

vim_opts(require("user.user_config").options)
