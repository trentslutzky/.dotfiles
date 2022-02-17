call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " The NERD tree
Plug 'arcticicestudio/nord-vim' " nord colorscheme
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dylanaraps/wal.vim' " colorscheming for wal colors
Plug 'yuezk/vim-js' " js stuff
Plug 'maxmellon/vim-jsx-pretty' " jsx(react) stuff
Plug 'Yggdroot/indentLine' " indent lines
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-surround' " change things surrounting things
Plug 'raimondi/delimitmate' " auto close quotes, etc
Plug 'JuliaEditorSupport/julia-vim' " julia

call plug#end()

" Load the colorscheme
colorscheme wal

set tabstop=2
set shiftwidth=2
set expandtab

set number relativenumber
hi CursorLine cterm=bold ctermbg=NONE ctermfg=NONE
set cursorline

" indent lines config
let g:indentLine_char = '|'

" airline config
let g:airline#extensions#tabline#enabled = 1

" NERDtree configs and stuff

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Map Crl-L to toggle NERDTree
nmap <C-l> :NERDTreeToggle<CR>
nmap <C-k> :NERDTreeFocus<CR>
