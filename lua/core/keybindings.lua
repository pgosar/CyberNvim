local map = require("core.utils.utils").map
vim.g.mapleader = " "

-- Trouble
map("n", "tr", "<CMD>TroubleToggle lsp_references<CR>")
map("n", "td", "<CMD>TroubleToggle lsp_definitions<CR>")
map("n", "cd", "<CMD>Trouble<CR>")

-- UFO
map("n", "zR", "<CMD>lua require('ufo').openAllFolds")
map("n", "zM", "<CMD>lua require('ufo').closeAllFolds")

-- ZenMode
map("n", "<leader>zm", "<CMD>ZenMode<CR>")

-- NeoTree
map("n", "<leader>nt", "<CMD>Neotree reveal left<CR>")
map("n", "<leader>nf", "<CMD>Neotree reveal float<CR>")

-- Aerial
map("n", "<leader>a", "<CMD>AerialToggle<CR>")
map("n", "<leader>a", "<CMD>AerialToggle!<CR>")
map("n", "{", "<CMD>AerialPrev<CR>")
map("n", "}", "<CMD>AerialNext<CR>")

-- Searching and Highlighting
map("n", "m", "<CMD>noh<CR>")
map("n", "/", "<CMD>set hlsearch<CR>/")
map("n", "i", "<CMD>set nohlsearch<CR>i")
map("n", "a", "<CMD>set nohlsearch<CR>a")
map("n", "I", "<CMD>set nohlsearch<CR>I")
map("n", "A", "<CMD>set nohlsearch<CR>A")

-- Movement
-- in insert mode, type <c-d> and your cursor will move past the next separator
-- such as quotes, parens, brackets, etc.
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><CMD>noh<cr><right>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")

-- Command mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Telescope
map("n", "ff", "<CMD>Telescope git_files hidden=true<CR>")
map("n", "fg", "<CMD>Telescope live_grep<CR>")
map("n", "fb", "<CMD>Telescope buffers<CR>")
map("n", "fh", "<CMD>Telescope help_tags<CR>")

-- MoveLine
map("n", "<A-j>", "<CMD>MoveLine(1)<CR>")
map("n", "<A-k>", "<CMD>MoveLine(-1)<CR>")
map("n", "<A-h>", "<CMD>MoveHChar(-1)<CR>")
map("n", "<A-l>", "<CMD>MoveHChar(1)<CR>")
map("n", "<leader>wf", "<CMD>MoveWord(1)<CR>")
map("n", "<leader>wb", "<CMD>MoveWord(-1)<CR>")
map("v", "<A-j>", "<CMD>MoveBlock(1)<CR>")
map("v", "<A-k>", "<CMD>MoveBlock(-1)<CR>")
map("v", "<A-h>", "<CMD>MoveHBlock(-1)<CR>")
map("v", "<A-l>", "<CMD>MoveHBlock(1)<CR>")

-- Notify
map("n", "<ESC>", "<CMD>lua require('notify').dismiss()<CR>")
map("i", "<ESC>", "<CMD>lua require('notify').dismiss()<CR><ESC>")

-- Command mode
map("c", "<C-P>", "<Up>")
map("c", "<C-N>", "<Down>")

-- More LSP stuff
_G.buf = vim.lsp.buf
map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>")
map("n", "gD", "<CMD>lua buf.declaration()<CR>")
map("n", "gd", "<CMD>lua buf.definition()<CR>")
map("n", "K", "<CMD>lua buf.hover()<CR>")
map("n", "gi", "<CMD>lua buf.implementation()<CR>")
map("n", "<C-k>", "<CMD>lua buf.signature_help()<CR>")
map("n", "<space>D", "<CMD>lua buf.type_definition()<CR>")
map("n", "<space>rn", "<CMD>lua buf.rename()<CR>")
map("n", "<space>ca", "<CMD>lua buf.code_action()<CR>")
map("n", "gr", "<CMD>lua buf.references()<CR>")

-- Session
map("n", "<leader>s", "<CMD>SessionManager save_current_session<CR>")
map("n", "<leader>o", "<CMD>SessionManager load_session<CR>")

-- ToggleTerm
_G.term = require("plugin-configs.toggleterm")
local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
map("n", "<leader><c-\\>t", "<CMD>ToggleTerm direction=tab<CR>")
map("n", "<c-\\>", "<CMD>TermExec go_back=0 cmd='" .. git_root .. "'<CR>")
map("n", "<leader>tk", "<CMD>TermExec go_back=0 direction=float cmd='" .. git_root .. "&& tokei'<CR>")
map("n", "<leader>gg", "<CMD>lua term.lazygit_toggle()<CR>")
map("n", "<leader>gd", "<CMD>lua term.gdu_toggle()<CR>")
map("n", "<leader>bt", "<CMD>lua term.bashtop_toggle()<CR>")

-- Hop
map("n", "<leader>j", "<CMD>HopWord<CR>")

-- Misc
map("n", "<leader>as", "<CMD>ASToggle<CR>")
