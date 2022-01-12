call plug#begin('~/.vim/plugged')

Plug 'hoob3rt/lualine.nvim' " lua status line
Plug 'kyazdani42/nvim-web-devicons' " icons in lualine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dylanaraps/wal.vim' " colorscheming for wal colors
Plug 'yuezk/vim-js' " js stuff
Plug 'maxmellon/vim-jsx-pretty' " jsx(react) stuff
Plug 'tpope/vim-repeat' " dependancy for ???
Plug 'Yggdroot/indentLine' " indent lines
Plug 'tpope/vim-commentary' " commenting
Plug 'tpope/vim-surround' " change things surrounting things
Plug 'raimondi/delimitmate' " auto close quotes, etc
Plug 'calviken/vim-gdscript3'
Plug 'rust-lang/rust.vim' " rust shit
Plug 'JuliaEditorSupport/julia-vim' " julia
Plug 'evanleck/vim-svelte', {'branch': 'main'} " svelte

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

" Lualine configuration
lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
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
	  lualine_z = {'location'}
	  },
  extensions = {}
}
EOF

