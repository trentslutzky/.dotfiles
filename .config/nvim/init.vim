call plug#begin('~/.vim/plugged')

" stuff for autocomplete and snippets
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" a bunch of common snippets
Plug 'rafamadriz/friendly-snippets'
" react snippets  
Plug 'mlaursen/vim-react-snippets'

" NERD tree
Plug 'scrooloose/nerdtree' " The NERD tree
Plug 'Xuyuanp/nerdtree-git-plugin' " NERD tree git plugin

" dev icons for nicer looking stuff
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'vim-airline/vim-airline'

Plug 'Yggdroot/indentLine' " indent lines
Plug 'tpope/vim-commentary' " commenting
Plug 'raimondi/delimitmate' " auto close quotes, etc

" telescopen fuzzy find
" dependancies - ripgrep (pacman)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" language specific stuff
Plug 'yuezk/vim-js' " js stuff
Plug 'maxmellon/vim-jsx-pretty' " jsx(react) stuff

" colorscheme stuff
Plug 'joshdick/onedark.vim'
Plug 'dylanaraps/wal.vim'

call plug#end()

syntax on
colorscheme wal

set tabstop=2
set shiftwidth=2
set expandtab

let g:vim_json_conceal=0
let g:indentLine_setConceal = 1

" disable the preview window for YCM
set completeopt-=preview

set number relativenumber
hi CursorLine cterm=bold ctermbg=NONE ctermfg=NONE
set cursorline

" indent lines config
" let g:indentLine_char = '|'
let g:indentLine_char = ''

" airline config - taken from github somewhere
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
" let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
" let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" NERDtree configs and stuff

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Map Crl-L to toggle NERDTree
nmap <C-l> :NERDTreeToggle<CR>
nmap <C-k> :Telescope fd<CR>

nnoremap <C-N> <C-W>h
nnoremap <C-E> <C-W>j
nnoremap <C-U> <C-W>k
nnoremap <C-O> <C-W>l

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  require'lspconfig'.pyright.setup{}
  require'lspconfig'.eslint.setup{}

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['eslint'].setup {
    capabilities = capabilities
  }

  -- custom icons for linting
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- diagnostics configs
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

EOF
