local lsp = require("lsp-zero")
lsp.preset("minimal")

lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local exist, user_config = pcall(require, "user.user_config")
lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = user_config.formatting_servers,
})

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local configs = exist and type(user_config) == "table" and user_config.lsp_configs or {}
			local config = type(configs) == "table" and configs[server_name] or {}
			require("lspconfig")[server_name].setup(config)
		end,
	},
})
lsp.setup()
