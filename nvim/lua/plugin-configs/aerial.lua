local aerial = require('aerial')

aerial.setup({
  filter_kind = {
    "Namespace",
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  highlight_on_hover = true,
  autojump = true,
  highlight_on_jump = false,
  manage_folds = true,
  show_guides = true,
})
