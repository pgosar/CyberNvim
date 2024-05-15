local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local lua_opts = lsp_zero.nvim_lua_ls()
require("lspconfig").basedpyright.setup({
	capabilities = capabilities,
	settings = {
		basedpyright = {
			reportMissingParameterType = false,
			reportUnknownArgumentType = false,
			reportUnknownLambdaType = false,
			reportUnknownMemberType = false,
			reportUnknownParameterType = false,
			reportUnknownVariableType = false,
		},
	},
})
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").markdown_oxide.setup({ capabilities = capabilities })
require("lspconfig").marksman.setup({ capabilities = capabilities })
require('lspconfig').lua_ls.setup(lua_opts)
