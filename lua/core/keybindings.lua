local map = require("core.utils.utils").map
vim.g.mapleader = " "
local M = {}

-- Trouble
map("n", "tr", "<CMD>TroubleToggle lsp_references<CR>")
map("n", "td", "<CMD>TroubleToggle lsp_definitions<CR>")
map("n", "cd", "<CMD>Trouble<CR>")

-- UFO
map("n", "zR", "<CMD>lua require('ufo').openAllFolds<CR>")
map("n", "zM", "<CMD>lua require('ufo').closeAllFolds<CR>")

-- ZenMode
map("n", "<leader>zm", "<CMD>ZenMode<CR>")

-- NeoTree
map("n", "<leader>nt", "<CMD>Neotree reveal left<CR>")
map("n", "<leader>nf", "<CMD>Neotree reveal float<CR>")

-- Aerial
map("n", "<leader>at", "<CMD>AerialToggle<CR>")
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
map("n", "<leader>ff", "<CMD>Telescope git_files hidden=true<CR>")
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
map("n", "<leader>fa", "<CMD>Telescope aerial<CR>")
map("n", "<leader>fp", "<CMD>Telescope projects<CR>")

-- Move lines and blocks
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

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
local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
map("n", "<leader><c-\\>t", "<CMD>ToggleTerm direction=tab<CR>")
map("n", "<c-\\>", "<CMD>TermExec go_back=0 cmd='" .. git_root .. "'<CR>")
map("n", "<leader>tk", "<CMD>TermExec go_back=0 direction=float cmd='" .. git_root .. "&& tokei'<CR>")
map("n", "<leader>gg", "<CMD>lua term.lazygit_toggle()<CR>")
map("n", "<leader>gd", "<CMD>lua term.gdu_toggle()<CR>")
map("n", "<leader>bt", "<CMD>lua term.bashtop_toggle()<CR>")

-- Hop
map("n", "<leader>j", "<CMD>HopWord<CR>")

-- Gitsigns

-- making this a function here because all it does is create keybinds for gitsigns but
-- it needs to be attached to an on_attach function.
M.gitsigns = function()
  local gs = package.loaded.gitsigns
  map("n", "]c", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })
  map("n", "[c", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, { expr = true })

  map("n", "<leader>hs", gs.stage_hunk)
  map("n", "<leader>hr", gs.reset_hunk)
  map("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)
  map("v", "<leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)
  map("n", "<leader>hS", gs.stage_buffer)
  map("n", "<leader>hu", gs.undo_stage_hunk)
  map("n", "<leader>hR", gs.reset_buffer)
  map("n", "<leader>hp", gs.preview_hunk)
  map("n", "<leader>hb", function()
    gs.blame_line({ full = true })
  end)
  map("n", "<leader>tb", gs.toggle_current_line_blame)
  map("n", "<leader>hd", gs.diffthis)
  map("n", "<leader>hD", function()
    gs.diffthis("~")
  end)
  map("n", "<leader>td", gs.toggle_deleted)
  map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

-- Misc
map("n", "<leader>as", "<CMD>ASToggle<CR>")

return M
