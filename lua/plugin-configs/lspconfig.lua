local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").jedi_language_server.setup({ capabilities = capabilities })
require("lspconfig").marksman.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			globals = {
				"vim",
				"require",
			},
			diagnostics = {
				disable = { "missing-fields" },
			},
			hint = {
				enable = true,
			},
		},
	},
})
