require('core_init')
local null_ls = require("null-ls")
local b = null_ls.builtins

null_ls.setup({
  sources = {
    b.formatting.lua_format,
    b.formatting.autopep8,
  },
})
