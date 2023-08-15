local null_ls = require("null-ls")
local conf = require("user.user_config")
local sources = conf.setup_sources and conf.setup_sources(null_ls.builtins) or nil
null_ls.setup({
  sources = sources,
})
