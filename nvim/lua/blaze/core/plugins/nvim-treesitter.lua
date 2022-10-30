local status, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then
  return
end

treesitter.setup({
  ensure_installed = 'all',
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})
