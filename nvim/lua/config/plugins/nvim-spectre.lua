return {
  'nvim-pack/nvim-spectre',
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>r", "<cmd>Spectre<cr>")

    require('spectre').setup({
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
    })
  end
}
