call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe', { 'do': 'yarn global add typescript typescript-language-server vls'  }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale', { 'do': 'yarn global add eslint_d' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'wikitopian/hardmode'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
call plug#end()
