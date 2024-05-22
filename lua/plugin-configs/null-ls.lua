local null_ls = require("null-ls")

local exist, sources = pcall(require, "user.sources")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sauces = exist and type(sources) == "table" and sources.setup_sauces and sources.setup_sauces(null_ls.builtins)
	or {}

null_ls.setup({
	sources = sauces,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
