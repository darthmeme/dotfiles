local status, lspconfig = pcall(require, 'lspconfig') 

if not status then
  return
end

local on_attach = function (client, bufnr)
  local setmap = vim.api.nvim_set_keymap
  local options = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, options)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
end

lspconfig['tsserver'].setup({
  on_attach = on_attach
})

lspconfig['volar'].setup({
  on_attach = on_attach
})

lspconfig['graphql'].setup({
  on_attach = on_attach
})

lspconfig['tailwindcss'].setup({
  on_attach = on_attach
})

lspconfig['sumneko_lua'].setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lspconfig['eslint'].setup({
  on_attach = on_attach
})

vim.cmd([[
  augroup eslint_format_on_save
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.vue,*.graphql EslintFixAll
  augroup end
]])

