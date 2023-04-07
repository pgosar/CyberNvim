vim.opt.shortmess:append { s = true, I = true } -- disable startup message
vim_opts({
	opt = {
    swapfile = false,              -- disable swapfiles   
		number = true,                 -- add line numbers
		signcolumn = "yes",            -- create sign column
		numberwidth = 6,               -- width of sign column

    -- tab settings {
		expandtab = true,
    tabstop = 2,
    softtabstop = 2,
		shiftwidth = 2,
    -- }
		updatetime = 100,              -- milliseconds to wait before updates

    -- line breaks {
		linebreak = true,
		showbreak = "=>>",
		textwidth = 100,
		breakindent = true,
		breakindentopt = "shift:2,min:40,sbr",
    -- }
    -- handle capital letters when searching {
		smartcase = true,
		ignorecase = true,
    -- }
    -- folds
		foldmethod = "expr",
    foldexpr="nvim_treesitter#foldexpr()",
		foldlevel = 2,
		foldcolumn = "2",
		foldlevelstart = 99,
		foldopen = "jump,block,hor,mark,percent,quickfix,search,tag,undo",
		foldenable = false,
    -- }
		clipboard = "unnamedplus",        -- set clipboard
		scrolloff = 5,                    -- gap between edge of screen and cursor
		autowrite = true,                 -- autosave
		confirm = true,                   -- prompt to save instead of erroring
		autochdir = true,                 -- set working dir for relative filepaths
		termguicolors = true,             -- better colors
    undofile = true,                  -- persistent undo
    sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
    hidden = true,
	},
  g = {
    zipPlugin = false,                -- disable zip
    load_black = false,               -- disable black
    loaded_2html_plugin = true,       -- disable 2html
    loaded_getscript = true,          -- disable getscript
    loaded_getscriptPlugin = true,    -- disable getscript
    loaded_gzip = true,               -- disable gzip
    loaded_logipat = true,            -- disable logipat
    loaded_matchit = true,            -- disable matchit
    loaded_remote_plugins = true,     -- disable remote plugins
    loaded_tar = true,                -- disable tar
    loaded_tarPlugin = true,          -- disable tar
    loaded_zip = true,                -- disable zip
    loaded_zipPlugin = true,          -- disable zip
    loaded_vimball = true,            -- disable vimball
    loaded_vimballPlugin = true,      -- disable vimball
  }
})

