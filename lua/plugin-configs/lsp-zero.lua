local lsp = require("lsp-zero")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

lsp.extend_lspconfig()

lsp.set_sign_icons({
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
})

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["black"] = { "python" },
		["stylua"] = { "lua" },
		["cbfmt"] = { "markdown" },
		["clang_format"] = { "cpp", "c", "json", "javascript", "java", "cs" },
	}
})

lsp.setup()
