-- luacheck: globals vim

local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

cmd({ 'BufWinLeave', 'BufWritePost' }, {
  desc = "auto run :PackerCompile whenever plugins.lua is updated",
  group = augroup("packer", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

cmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
  desc = "fix tree sitter folds issue",
  group = augroup('treesitter folds', { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


vim.cmd([[autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif]])
