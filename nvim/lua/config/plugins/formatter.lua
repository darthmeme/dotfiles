return {
  "mhartington/formatter.nvim",
  config = function()
    local formatter = require("formatter")

    formatter.setup({
      filetype = {
        ["*"] = {
          function()
            return {
              exe = "prettierd",
              args = {vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
        }
      }
    })
  end
}
