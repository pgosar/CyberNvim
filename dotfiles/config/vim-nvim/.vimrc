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
" display all buffers if one tab open
let g:airline#extensions#tabline#enabled = 1
" how file paths are shown
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" powerline integration
let g:airline_powerline_fonts = 1
" status bar theme
let g:airline_theme='bubblegum'
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
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
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'ConradIrwin/vim-bracketed-paste'
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
" Automatically deletes all trailing whitespace and newlines at end of
" file on save & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
" limelight color dimming
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
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
" alternate keybindings for multiline
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<C-S-.>'
let g:VM_maps["Add Cursor Up"] = '<C-S-,>'
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
" visual block mode
command! Vb normal! <C-v>
nnoremap <silent> vb :Vb<CR>
" WSL yank support
if system('uname -r') =~ "microsoft"
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
endif

" column at 80 chars and highlight where text goes over
call matchadd('ColorColumn', '\(\%81v\|\%101v\)', 200)
 augroup vimrc
   autocmd!
   autocmd ColorScheme * highlight ColorColumn cterm=bold ctermfg=magenta
         \ ctermbg=NONE gui=bold guifg=magenta guibg=NONE
 augroup END
