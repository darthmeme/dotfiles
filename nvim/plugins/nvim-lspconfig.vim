lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }
end

nvim_lsp.eslint.setup{
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "graphql" }
}

nvim_lsp.volar.setup{
  on_attach = on_attach,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

nvim_lsp.graphql.setup{
  on_attach = on_attach
}
EOF

autocmd BufWritePre *.js,*.ts,*.vue,*.graphql EslintFixAll
