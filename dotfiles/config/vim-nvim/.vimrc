" gets rid of swapfiles
set noswapfile
" syntax highlighting
syntax enable
filetype plugin indent on
" enable usage of mouse in all modes
set mouse=a
" line count
set number relativenumber
set numberwidth=6
" set command history
set history=1000
" makes symbols replace line number when necessary
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
" for searching
set smartcase
set ignorecase
set hlsearch
set incsearch
" code folding
set foldmethod=indent
set foldlevel=2
set foldcolumn=2
set nofoldenable
" clipboard
set clipboard=unnamedplus
" tab width to two
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" Smart wrapping indentation
set breakindent
" keeps indent level on line break
set breakindentopt=shift:2,min:40,sbr
" append '>>' to indent
set showbreak=>>
" show keystrokes in status line
set showcmd
" splits new windows to the right and bottom instead
set splitbelow splitright
" autocompletion on commands
set wildmenu
set wildmode=longest:full,full
" lengthen timeout of leader key and commands
set timeoutlen=1000
set ttimeoutlen=1000
" auto file save
set autowrite
" cursor position
set ruler
" prompt to save instead of erroring
set confirm
" disables auto-comment creation after first
set formatoptions-=cro
" persistent undo
set undodir=~/.vim-undo
set undofile
" disable lsp for ale
let g:ale_disable_lsp = 1
" leader character to space
let mapleader=" "
" display all buffers if one tab open
let g:airline#extensions#tabline#enabled = 1
" how file paths are shown
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" powerline integration
let g:airline_powerline_fonts = 1
" status bar theme
let g:airline_theme='bubblegum'
let g:session_autosave = 'yes'

call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'rust-lang/rust.vim'
  Plug 'godlygeek/tabular', { 'on': 'Tab' }
  Plug 'tpope/vim-fugitive'
  Plug 'thaerkh/vim-indentguides'

  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'tomasr/molokai'

  Plug 'dense-analysis/ale'
  Plug 'frazrepo/vim-rainbow'
  Plug 'Raimondi/delimitMate'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'airblade/vim-gitgutter'
  Plug 'lervag/vimtex'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'zirrostig/vim-schlepp'
  Plug 'PeterRincker/vim-searchlight'
  Plug 'tpope/vim-surround'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" shows number of errors on status bar
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

set statusline+=\ %{LinterStatus()}
" enables rainbow brackets
let g:rainbow_active = 1
" disables auto saving for vim session
let g:session_autosave = 'no'
" auto formats files on save
let g:ale_fix_on_save = 1
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '|'
" add spaces after comment delimiters
let g:NERDSpaceDelims = 1
" compact syntax for multi line comments
let g:NERDCompactSexyComs = 1
" allow commenting empty lines
let g:NERDCommentEmptyLines = 1
" gets rid of dollar sign new line char
set listchars=tab:>-
" Format
command! -nargs=0 Format :call CocAction('format')
" " highlight symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" deal with color
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let g:gruvbox_number_column = 'bg1'
autocmd vimenter * ++nested colo gruvbox

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
" toggle nerd tree
nnoremap <silent> nt :NERDTreeToggle<CR>
" for save session
nnoremap <Leader>o :OpenSession<CR>
nnoremap <Leader>s :SaveSession<CR>
" autocomplete config
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" auto-import
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" remap esc in insert mode
inoremap <C-k> <ESC>
" gets rid of highlighting after searching
nnoremap <CR> :noh<CR><CR>
" errors
nnoremap <silent> cd :lopen<CR>
nnoremap <silent> cl :lclose<CR>
nnoremap <silent> [g :lnext<CR>
nnoremap <silent> ]g :lprev<CR>

" Coc navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> ga :CocAction<CR>

tnoremap <Esc> <C-\><C-n>
" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)
" toggle goyo
nnoremap <silent> goyo :Goyo<CR>
nnoremap <silent> !goyo :Goyo!<CR>
" toggle limelight
nnoremap <silent> lime :Limelight<CR>
nnoremap <silent> !lime :Limelight!<CR>
" now just ctrl+key to switch windows
noremap <C-h> <C-w> h
noremap <C-j> <C-w> j
noremap <C-k> <C-w> k
noremap <C-l> <C-w> l
" alternate keybindings for multiline
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<Leader>.'
let g:VM_maps["Add Cursor Up"] = '<Leader>,'
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
" visual block mode
command! Vb normal! <C-v>
nnoremap <silent> vb :Vb<CR>
" visual block text movement and copying
vnoremap <unique> <up>    <Plug>SchleppUp
vnoremap <unique> <down>  <Plug>SchleppDown
vnoremap <unique> <left>  <Plug>SchleppLeft
vnoremap <unique> <right> <Plug>SchleppRight
vnoremap <unique> dupk    <Plug>SchleppDupUp
vnoremap <unique> dupj    <Plug>SchleppDupDown
vnoremap <unique> duph    <Plug>SchleppDupLeft
vnoremap <unique> dupl    <Plug>SchleppDupRight
" toggling between buffers
noremap <Leader>n :w \| bn<cr>
noremap <Leader>p :w \| bp<cr>
noremap <Leader>d :w \| bd<cr>
" tagbar
nnoremap <Leader>tt :TagbarToggle<CR>
" snippet insertion
let g:UltiSnipsExpandTrigger="<Leader>n"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" tab out of delimiters
inoremap <S-Tab>
" WSL yank support
if system('uname -r') =~ "microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
  endif

" column at 80 chars and highlight where text goes over
call matchadd('ColorColumn', '\(\%81v\|\%121v\)', 200)
  augroup vimrc
    autocmd!
    autocmd ColorScheme * highlight ColorColumn cterm=bold ctermfg=196
         \ ctermbg=None guifg=Red guibg=NONE
  augroup END

" fixes lag of exiting insert/visual mode
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
" get rid of auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" auto save folds and cursor position
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END
