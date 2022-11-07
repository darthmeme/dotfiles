vim.g.mapleader = " "

local setmap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

setmap('n', '<leader>i', ":e ~/.config/nvim/init.lua <CR>", options)
setmap('n', "<leader>c", ":bw <CR>", options)
setmap('v', "<C-r>", "\"hy:%s/<C-r>h//g<left><left>", options)
setmap('n', "<C-d>", "<C-d>zz", options)
setmap('n', "<C-u>", "<C-u>zz", options)
setmap('n', "L", ":lua vim.diagnostic.open_float(nil, { focus = false }) <CR>", options)

-- Telescope
setmap('n', '<leader>ss', ":Telescope find_files <CR>", options)
setmap('n', '<leader>sb', ":Telescope buffers <CR>", options)
setmap('n', '<leader>sw', ":Telescope live_grep <CR>", options)

-- Toggleterm
local _, status = pcall(require, 'toggleterm.terminal')

if not status then
  return
end

local Terminal  = require('toggleterm.terminal').Terminal

local nnn = Terminal:new({
  direction = 'float',
  cmd = "nnn",
  hidden = true,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-c>", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

local lazygit = Terminal:new({
  direction = 'float',
  cmd = "lazygit",
  hidden = true,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-c>", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function()
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _nnn_toggle()
  nnn:toggle()
end

setmap('n', '<leader>fd', ':lua _nnn_toggle() <CR>', options)
setmap('n', '<leader>fg', ':lua _lazygit_toggle() <CR>', options)
