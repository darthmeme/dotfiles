local function init()
  require('blaze.core.options')
  require('blaze.core.plugins')
  require('blaze.core.keymaps')
  require('blaze.core.theme')
  require('blaze.core.plugins.telescope')
  require('blaze.core.plugins.nvim-treesitter')
  require('blaze.core.plugins.mason')
  require('blaze.core.plugins.nvim-lspconfig')
  require('blaze.core.plugins.nvim-cmp')
  require('blaze.core.plugins.toggleterm')
  require('blaze.core.plugins.nvim-autopairs')
end

return {
  init = init
}
