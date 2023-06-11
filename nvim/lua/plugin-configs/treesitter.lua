local conf = require("nvim-treesitter.configs")

conf.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {"html"}
    },
    incremental_selection = {enable = true},
    autotag = {enable = true},
    rainbow = {enable = true, disable = {'html'}, extended_mode = false},
    context_commentstring = {enable = true}
}
