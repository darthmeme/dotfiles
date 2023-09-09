return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")
    local keymap = vim.keymap

    telescope.load_extension("fzf")

    keymap.set("n", "<leader>ss", "<cmd>Telescope find_files<cr>")
    keymap.set("n", "<leader>sw", "<cmd>Telescope live_grep<cr>")
    keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
  end
}
