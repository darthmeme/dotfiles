vim.g.mapleader = " "

local setmap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

setmap('n', '<leader>i', ":e ~/.config/nvim/init.lua <CR>", options)
setmap('n', "<leader>c", ":bw <CR>", options)
setmap('v', "<C-r>", "\"hy:%s/<C-r>h//g<left><left>", options)

-- Telescope
setmap('n', '<leader>ss', ":Telescope find_files <CR>", options)
setmap('n', '<leader>sb', ":Telescope buffers <CR>", options)
setmap('n', '<leader>sw', ":Telescope live_grep <CR>", options)
