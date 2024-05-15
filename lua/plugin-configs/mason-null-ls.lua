local exist, sources = pcall(require, "user.sources")
local sauces = exist
		and type(sources) == "table"
		and sources.mason_ensure_installed
		and sources.mason_ensure_installed.null_ls
	or {}

require("mason-null-ls").setup({
	ensure_installed = sauces,
})
