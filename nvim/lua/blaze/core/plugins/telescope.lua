local status, telescope = pcall(require, 'telescope')

if not status then
  return
end

vim.api.nvim_set_hl(0, 'TelescopeNormal', {
  bg = 'NONE'
})

vim.api.nvim_set_hl(0, 'TelescopeBorder', {
  bg = 'NONE',
  fg = '#29a4bd'
})


telescope.setup()
