  set tabstop=2 softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
  set hidden
  set nu
  set rnu
set signcolumn=yes
set termguicolors
set scrolloff=10
set noswapfile
set nobackup
set nohlsearch
set completeopt=menuone,noselect

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe', { 'do': 'yarn global add typescript typescript-language-server vls'  }
Plug 'ghifarit53/tokyonight-vim'
Plug 'phaazon/hop.nvim'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'dense-analysis/ale', { 'do': 'yarn global add eslint_d' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
call plug#end()

lua <<EOF
-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
  },
}
-- nvim compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
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

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <leader>ss <cmd>Telescope find_files<cr>
nnoremap <leader>sb <cmd>Telescope buffers<cr>
nnoremap <leader>sw <cmd>Telescope live_grep<cr>
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
nnoremap <leader>gd <cmd>ALEGoToDefinition<cr>
nnoremap <leader>gr <cmd>ALERename<cr>
nnoremap <leader>t <cmd>NERDTreeToggle<cr>
