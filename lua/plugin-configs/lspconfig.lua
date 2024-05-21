local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

require("lspconfig").basedpyright.setup({
	capabilities = capabilities,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "basic",
			},
		},
	},
})
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").markdown_oxide.setup({ capabilities = capabilities })
require("lspconfig").marksman.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
