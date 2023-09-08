vim.g.mapleader = " "

local setmap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

setmap('v', "<C-r>", "\"hy:%s/<C-r>h//g<left><left>", options)
setmap('n', "<C-d>", "<C-d>zz", options)
setmap('n', "<C-u>", "<C-u>zz", options)
