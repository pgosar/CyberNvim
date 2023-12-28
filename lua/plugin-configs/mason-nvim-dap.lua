local exist, user_config = pcall(require, "user.user_config")
local sources = exist and user_config.ensure_installed.dap or {}

require("mason-nvim-dap").setup({
	ensure_installed = sources,
})
