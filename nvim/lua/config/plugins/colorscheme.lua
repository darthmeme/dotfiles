return {
  "catppuccin/nvim",
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      transparent_background = true
    })

    vim.cmd.colorscheme("catppuccin")
  end
}
