-- luacheck: globals vim

local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

cmd("LspAttach", {
	group = augroup("LspAttach_inlayhints", { clear = true }),
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})

cmd({ "BufWinLeave", "BufWritePost" }, {
	desc = "auto run :PackerCompile whenever plugins.lua is updated",
	group = augroup("packer", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	desc = "fix tree sitter folds issue",
	group = augroup("treesitter folds", { clear = true }),
	pattern = { "*" },
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})

cmd({ "BufWritePre" }, {
	desc = "remove trailing whitespace on save",
	group = augroup("remove trailing whitespace", { clear = true }),
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

augroup("remember file state", { clear = true })
cmd({ "BufWinLeave" }, {
	desc = "remember file state",
	group = "remember file state",
	pattern = { "*.*" },
	command = "mkview",
})
cmd({ "BufWinEnter" }, {
	desc = "remember file state",
	group = "remember file state",
	pattern = { "*.*" },
	command = "silent! loadview",
})

cmd({ "User" }, {
	desc = "notify session saved",
	group = augroup("session save", { clear = true }),
	pattern = "SessionSavePost",
	command = "lua require('notify').notify('Session Saved', 'info')",
})
