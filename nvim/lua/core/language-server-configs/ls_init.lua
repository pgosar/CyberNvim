-- luacheck: globals vim

vim.notify = require("notify")
for _, source in ipairs({
	"core.language-server-configs.lua",
	"core.language-server-configs.tsserver",
	"core.language-server-configs.gopls",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.notify("Failed to load " .. source .. "\n\n" .. fault, "error")
	end
end
