set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hidden
set nu
set signcolumn=yes
set termguicolors
set scrolloff=10
set noswapfile
set nobackup
set nohlsearch

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ghifarit53/tokyonight-vim'
Plug 'phaazon/hop.nvim'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'dense-analysis/ale'
call plug#end()

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = {
\   '*': ['eslint'],
\}
let g:ale_fix_on_save = 1

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

lua require'lspconfig'.tsserver.setup{ }
lua require'lspconfig'.vuels.setup{ }

hi LspDiagnosticsVirtualTextError guifg=red gui=bold
hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold
hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold
hi LspDiagnosticsVirtualTextHint guifg=green gui=bold

let mapleader = " "

nnoremap <leader>sg <cmd>Telescope git_files<cr>
nnoremap <leader>sb <cmd>Telescope buffers<cr>
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
