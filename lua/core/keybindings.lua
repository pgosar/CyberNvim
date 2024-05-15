local map = require("core.utils").map

local group = {}
local enabled = require("core.utils").enabled
vim.g.mapleader = " " -- the leader key is the spacebar
local M = {}

-- Trouble
if enabled(group, "trouble") then
	map("n", "<leader>xd", "<CMD>Trouble lsp_definitions toggle<CR>")
	map("n", "<leader>xr", "<CMD>Trouble lsp_references toggle<CR>")
	map("n", "<leader>xQ", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
	map("n", "<leader>xL", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
	map("n", "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
	map("n", "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
end

-- UFO
if enabled(group, "ufo") then
	map("n", "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>")
	map("n", "zR", "<CMD>lua require('ufo').openAllFolds()<CR>")
end

-- Aerial
if enabled(group, "aerial") then
	map("n", "<leader>at", "<CMD>AerialToggle<CR>")
end

-- Searching and Highlighting
map("n", "m", "<CMD>noh<CR>")

-- Movement
-- in insert mode, type <c-d> and your cursor will move past the next separator
-- such as quotes, parens, brackets, etc.
map("i", "<C-a>", "<C-o>A")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><CMD>nohlsearch<cr><right>")

-- Command mode
map("c", "<C-n>", "<Down>")
map("c", "<C-p>", "<Up>")

-- Telescope
if enabled(group, "telescope") then
	map("n", "<leader>fa", "<CMD>Telescope aerial<CR>")
	map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
	map("n", "<leader>fc", "<CMD>Telescope commands<CR>")
	map("n", "<leader>ff", "<CMD>Telescope git_files hidden=true<CR>", { desc = "Telescope Find Files" })
	map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
	map("n", "<leader>fp", "<CMD>Telescope lazy_plugins<CR>", { desc = "Search For Plugins" })
	map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
	map("n", "<leader>fs", "<CMD>Telescope symbols<CR>")
	map("n", "<leader>fu", "<cmd>Telescope undo<cr>")
end

-- Move lines and blocks
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Notify
if enabled(group, "notify") then
	map("i", "<ESC>", "<CMD>lua require('notify').dismiss()<CR><ESC>")
	map("n", "<ESC>", "<CMD>lua require('notify').dismiss()<CR>")
end

if enabled(group, "myeyeshurt") then
	map("n", "<leader>sb", function()
		require("myeyeshurt").start()
	end, { desc = "Begin The Snow" })
	map("n", "<leader>sx", function()
		require("myeyeshurt").stop()
	end, { desc = 'Stop The Snow' })
end

-- More LSP stuff
if enabled(group, "lsp_zero") then
	_G.buf = vim.lsp.buf
	-- lsp agnostic global rename
	map("n", "<leader>ca", "<CMD>lua buf.code_action()<CR>")
	map("n", "<leader>rn", "<CMD>lua buf.rename()<CR>")
	map("n", "K", "<CMD>lua buf.hover()<CR>")
	map("n", "gD", "<CMD>lua buf.definition()<CR>")
	map("n", "gd", "<CMD>lua buf.declaration()<CR>")
	map("n", "gi", "<CMD>lua buf.implementation()<CR>")
	map("n", "gr", "<CMD>Telescope lsp_references<CR>")
	map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "global substitution" })
	map("n", "sh", "<CMD>lua buf.signature_help()<CR>")
end

-- Session
if enabled(group, "session_manager") then
	map("n", "<leader>o", "<CMD>SessionManager load_session<CR>")
	map("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>")
end

-- ToggleTerm
if enabled(group, "toggleterm") then
	local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
	-- opens terminal as a new tab at the git root
	map("n", "<C-\\>t", "<CMD>ToggleTerm direction=tab<CR>", { desc = "New Tabbed Terminal" })
	-- as a regular window
	map("n", "<C-\\>", "<CMD>TermExec go_back=0 cmd='" .. git_root .. "'<CR>", { desc = "New Terminal" })
	map(
		"n",
		"<leader>tk",
		"<CMD>TermExec go_back=0 direction=float cmd='" .. git_root .. "&& tokei'<CR>",
		{ desc = "tokei" }
	)
	map("n", "<leader>gg", "<CMD>lua term.lazygit_toggle()<CR>", { desc = "Open Lazygit" })
end

-- Hop
if enabled(group, "hop") then
	map("n", "<leader>jw", "<CMD>HopWord<CR>", { desc = "Hop to Word" })
	map("n", "<leader>jl", "<CMD>HopLine<CR>", { desc = "Hop to Line" })
end

-- Gitsigns

-- making this a function here because all it does is create keybinds for gitsigns but
-- it needs to be attached to an on_attach function.
if enabled(group, "gitsigns") then
	M.gitsigns = function()
		local gs = package.loaded.gitsigns
		-- travel between hunks, backwards and forwards
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "go to previous git hunk" })
		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "go to next git hunk" })

		map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
		map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
		map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, { desc = "complete blame line history" })
		map("n", "<leader>lb", gs.toggle_current_line_blame, { desc = "toggle blame line" })
		-- diff at current working directory
		map("n", "<leader>hd", gs.diffthis, { desc = "diff at cwd" })
		-- diff at root of git repository
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end, { desc = "diff at root of git repo" })
		map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted line" })
	end
end

if enabled(group, "oil") then
	map("n", "<leader>ec", "<CMD>Oil ~/.config/nvim/lua<CR>", { desc = "Edit Nvim Config" })
	map("n", "<leader>ex", "<CMD>Oil<CR>", { desc = "File Explorer" })
end

-- Todo
if enabled(group, "todo-comments") then
	map("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" })

	map("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" })

	-- You can also specify a list of valid jump keywords
	map("n", "]t", function()
		require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
	end, { desc = "Next error/warning todo comment" })
end

-- suda
if enabled(group, "suda") then
	map("n", "<leader>su", function()
		vim.fn.feedkeys(":SudaWrite")
	end, { desc = "Gain Write Permission" })
end
-- toggle-bool
if enabled(group, "bool") then
	map("n", "<leader>tb", "<CMD>lua require('toggle-bool').toggle_bool()<CR>", { desc = "Toggle bool" })
end

-- install amongsus
if enabled(group, "duck") then
	map("n", "<leader>dd", function()
		require("duck").hatch("ඞ")
	end, { desc = "Spawn Your New Pet" })
	map("n", "<leader>dk", function()
		require("duck").cook()
	end, { desc = "Cook Your Pet" })
	map("n", "<leader>da", function()
		require("duck").cook_all()
	end, { desc = "Cook All Of Your Pets" })
end

-- Git Link
if enabled(group, "gitlink") then
	map("n", "<leader>gl", "<cmd>GitLink!<cr>", { desc = "Open git link" })
	map("n", "<leader>gy", "<cmd>GitLink<cr>", { desc = "Yank git link" })
end

-- lspzero
if enabled(group, "lsp_zero") then
	map("n", "<leader>F", "<CMD>LspZeroFormat<CR>", { desc = "Format File" })
end

return M
