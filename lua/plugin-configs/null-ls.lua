local null_ls = require("null-ls")
-- local b = null_ls.builtins

null_ls.setup({
	sources = require("user.user_config").null_ls_sources,
})
