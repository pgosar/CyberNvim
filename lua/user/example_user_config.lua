-- use a user_config.lua file to provide your own configuration

local M = {}

-- the following two fields should not be changed beyond adding more
-- entries to the table
local b = require("null-ls").builtins
M.null_ls_sources = {
	b.formatting.autopep8,
	b.code_actions.gitsigns,
}

M.formatting_servers = {
	["rust_analyzer"] = { "rust" },
}

return M
