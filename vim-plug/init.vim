" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - e.g. `call plug#begin('~/.vim/plugged')`

set number        " Exibe números de linha na lateral da janela do editor
set tabstop=4     " Define a largura de um caractere de tabulação
set shiftwidth=4  " Define a largura do recuo automático
set softtabstop=4 " Configura o número de espaços que o Vim/Neovim utiliza para simular a tabulação
set noexpandtab   " Indica que o Vim/Neovim não deve converter o caractere de tabulação (\t) em espaços
set colorcolumn=81 " Mostrar colunas para o limite de linhas

set smartindent    " Indentação automática inteligente
" set autoindent     " Manter indentação ao começar nova linha
set showmatch      " Destacar pares de parênteses e colchetes
set cursorline     " Destacar a linha do cursor
set hlsearch       " Destacar termos de busca
set incsearch      " Busca incremental
set mouse=a        " ativa o suporte ao rato

call plug#begin()

Plug '42Paris/42header'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " Ícones (opcional)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/toggleterm.nvim', { 'branch': 'main' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'              " Autocomplete principal
Plug 'hrsh7th/cmp-nvim-lsp'          " Integração do cmp com LSP
Plug 'hrsh7th/cmp-buffer'            " Sugestões baseadas no buffer atual
Plug 'hrsh7th/cmp-path'              " Sugestões de caminhos de arquivos
Plug 'hrsh7th/cmp-cmdline'           " Sugestões para linha de comando
Plug 'L3MON4D3/LuaSnip'              " Engine de snippets
Plug 'saadparwaiz1/cmp_luasnip'      " Integração do cmp com LuaSnip
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/which-key.nvim'
Plug 'echasnovski/mini.icons'
Plug 'sindrets/diffview.nvim'

call plug#end()

" Para ativar a scheme gruvbox-material
syntax on                   " Ativar syntax highlighting
set termguicolors           " Ativar suporte a cores true-color
set background=dark         " Use 'light' para fundo claro
colorscheme gruvbox-material

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Configurações de cada plugin
lua require('setup')
lua require('keymap')
