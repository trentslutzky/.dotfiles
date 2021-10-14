call plug#begin('~/.vim/plugged')

Plug 'hoob3rt/lualine.nvim' " lua status line
Plug 'kyazdani42/nvim-web-devicons' " icons in lualine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dylanaraps/wal.vim' " colorscheming for wal colors
Plug 'yuezk/vim-js' " js stuff
Plug 'maxmellon/vim-jsx-pretty' " jsx(react) stuff
Plug 'tpope/vim-repeat' " dependancy for ???
Plug 'folke/tokyonight.nvim' " tokyonight colorscheme
Plug 'Yggdroot/indentLine' " indent lines
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-surround' " change things surrounting things
Plug 'raimondi/delimitmate' " auto close quotes, etc
Plug 'morhetz/gruvbox'
Plug 'calviken/vim-gdscript3'

call plug#end()

" colorscheme
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 0
let g:tokyonight_italic_comments = 0
let g:tokyonight_italic_keywords = 0

" Load the colorscheme
colorscheme wal

set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase

set number relativenumber
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE
set cursorline

" indent lines config
let g:indentLine_char = '|'

" Lualine configuration
lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filetype'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
	  lualine_a = {'filename'},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {},
	  lualine_z = {}
	  },
  extensions = {}
}
EOF

