" gets rid of swapfiles
set noswapfile
" syntax highlighting
syntax enable
filetype plugin indent on
" enable usage of mouse in all modes
set mouse=a
" line count
set number relativenumber
" makes symbols replace line number when necessarry
set signcolumn=yes
" length of time to wait before triggering plugins
set updatetime=300
" stops text wrap from breaking apart words
set linebreak
" column count for wrap
set textwidth=80
" sets title of window to current editing file
set title
" spell check
set spell
" disables compatibility with vi
set nocompatible
" makes all clipboard registers act the same
set clipboard=unnamedplus
" tab width to two
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" Smart wrapping indentation
set breakindent
" keeps indent level on line break
set breakindentopt=shift:2,min:40,sbr
" append '>>' to indent
set showbreak=>>
" splits new windows to the right and bottom instead
set splitbelow splitright
" autocompletion on commands
set wildmenu
set wildmode=longest:full,full
" disable lsp for ale
let g:ale_disable_lsp = 1
" leader character to spacebar
let mapleader=" "
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" set tabs to 2 spaces
"shows number of errors on status bar
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
" enables rainbow brackets
let g:rainbow_active = 1
" disables auto saving for vim session
let g:session_autosave = 'no'
" auto formats files on save
let g:ale_fix_on_save = 1

" Format
command! -nargs=0 Format :call CocAction('format')
" highlight symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let g:gruvbox_number_column = 'bg1'
autocmd vimenter * ++nested colorscheme gruvbox

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" ctrl  to open nerd tree, and ctrl n to close
nnoremap <C-l> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" for save session
nnoremap <C-o> :OpenSession
nnoremap <C-s> :SaveSession<CR>
" remap esc in insert mode
inoremap <C-k> <ESC>

" errors
nmap <silent> cd :lopen<CR>
nmap <silent> cl :lclose<CR>
nmap <silent> [g :lnext<CR>
nmap <silent> ]g :lprev<CR>

" Coc navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga :CocAction<CR>

" tab for auto completion
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" tab for auto-import completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" esc to escape embedded terminal
tnoremap <Esc> <C-\><C-n>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" toggle goyo
nmap <silent> goyo :Goyo<CR>
nmap <silent> !goyo :Goyo!<CR>
" toggle limelight
nmap <silent> lime :Limelight<CR>
nmap <silent> !lime :Limelight!<CR>
" now just ctrl+key to switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
