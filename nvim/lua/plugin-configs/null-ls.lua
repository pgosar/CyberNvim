local null_ls = require("null-ls")
local b = null_ls.builtins

null_ls.setup({
    sources = {
        b.formatting.lua_format, b.formatting.autopep8,
        b.formatting.prettier.with({
            filetypes = {
                'markdown', 'javascript', 'javascriptreact', 'typescript',
                'typescriptreact'
            }
        }), b.hover.dictionary.with({filetypes = {'text', 'markdown'}}),
        b.completion.spell.with({filetypes = {'text', 'markdown'}})
    }
})
