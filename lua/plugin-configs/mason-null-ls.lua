local exist, user_config = pcall(require, "user.user_config")
local sources = exist and user_config.ensure_installed.null_ls or {}

require("mason-null-ls").setup({
	ensure_installed = sources,
})
