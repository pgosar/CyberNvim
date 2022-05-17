set noswapfile
syntax enable
filetype plugin indent on
set mouse=a
set number
set signcolumn=yes
set updatetime=300

let g:ale_disable_lsp = 1

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
call plug#end()

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
