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
cnoremap W w
cnoremap Q q
