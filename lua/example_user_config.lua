-- use a user_config.lua file to provide your own configuration

-- the following two fields should not be changed beyond adding more
-- entries to the table
local b = require("null-ls").builtins
local _null_ls_sources = {
	b.formatting.autopep8,
	b.code_actions.gitsigns,
}

local _formatting_servers = {
	["rust_analyzer"] = { "rust" },
}

return {
	null_ls_sources = _null_ls_sources,
	formatting_servers = _formatting_servers,
}
