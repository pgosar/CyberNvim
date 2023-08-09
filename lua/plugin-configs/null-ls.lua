local null_ls = require("null-ls")
local sources = require("user.user_config").setup_sources(null_ls.builtins)
null_ls.setup({
	sources = sources,
})
