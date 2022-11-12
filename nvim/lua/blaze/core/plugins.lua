vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")

if not status then
  return
end

packer.init({
  profile = {
    enable = false
  }
})

return packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/playground'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Theme
    use 'folke/tokyonight.nvim'

    -- Floating terminals
    use 'akinsho/toggleterm.nvim'

    -- QOL
    use 'andymass/vim-matchup'

    use 'tpope/vim-surround'

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    if packer_bootstrap then
      require('packer').sync()
    end
  end
)
