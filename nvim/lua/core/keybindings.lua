-- luacheck: globals vim
--
local map = require("core.utils.utils").map
vim.g.mapleader = " "

map("n", "gR", ":TroubleToggle lsp_references<CR>")
map("n", "gD", ":TroubleToggle lsp_definitions<CR>")
map("n", "cd", ":Trouble")
map("n", "<leader>zm", ":ZenMode<CR>")
map("n", "<leader>nt", ":Neotree reveal left<CR>")
map("n", "<leader>nf", ":Neotree reveal float<CR>")
map("n", "<leader>a", ":AerialToggle<CR>")
map("n", "m", ":noh<CR>")
map("n", "/", ":set hlsearch<CR>/")
map("n", "i", ":set nohlsearch<CR>i")
map("n", "a", ":set nohlsearch<CR>a")
map("n", "I", ":set nohlsearch<CR>I")
map("n", "A", ":set nohlsearch<CR>A")
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o>:noh<cr><right>")

map("n", "ff", ":Telescope git_files hidden=true<CR>")
map("n", "fg", ":Telescope live_grep<CR>")
map("n", "fb", ":Telescope buffers<CR>")
map("n", "fh", ":Telescope help_tags<CR>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")
map("v", "<C-b>", "^")
map("v", "<C-a>", "$")
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

map('n', '<leader>a', '<cmd>AerialToggle!<CR>')
map('n', '{', '<cmd>AerialPrev<CR>')
map('n', '}', '<cmd>AerialNext<CR>')

map("n", "<A-j>", ":MoveLine(1)<CR>")
map("n", "<A-k>", ":MoveLine(-1)<CR>")
map("n", "<A-h>", ":MoveHChar(-1)<CR>")
map("n", "<A-l>", ":MoveHChar(1)<CR>")
map("n", "<leader>wf", ":MoveWord(1)<CR>")
map("n", "<leader>wb", ":MoveWord(-1)<CR>")

-- Visual-mode commands
map("v", "<A-j>", ":MoveBlock(1)<CR>")
map("v", "<A-k>", ":MoveBlock(-1)<CR>")
map("v", "<A-h>", ":MoveHBlock(-1)<CR>")
map("v", "<A-l>", ":MoveHBlock(1)<CR>")
