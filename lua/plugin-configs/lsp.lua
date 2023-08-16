local lsp = require("lsp-zero")
lsp.preset("minimal")

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

lsp.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
})

if not require("core.utils.utils").plugin_loaded("autosave") then
  lsp.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = require("user.user_config").formatting_servers,
  })
end
lsp.setup()
