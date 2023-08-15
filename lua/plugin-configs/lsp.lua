local lsp = require("lsp-zero")
lsp.preset("minimal")
lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
end)

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
if not _G.autosave then
  lsp.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = require("user.user_config").formatting_servers,
  })
end

require("core.language-server-configs.ls_init")
lsp.setup()
