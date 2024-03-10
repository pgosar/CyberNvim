local exist, user_config = pcall(require, "user.user_config")
local sources = exist
		and type(user_config) == "table"
		and user_config.mason_ensure_installed
		and user_config.mason_ensure_installed.null_ls
	or {}

require("mason-null-ls").setup({
	ensure_installed = sources,
})
