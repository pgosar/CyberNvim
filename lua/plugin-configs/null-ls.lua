local null_ls = require("null-ls")

local exist, user_config = pcall(require, "user.user_config")
local sources = exist and user_config.setup_sources(null_ls.builtins) or {}

null_ls.setup({
	sources = sources,
})
