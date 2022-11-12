local status, lspconfig = pcall(require, 'lspconfig')

if not status then
  return
end

local on_attach = function (client, bufnr)
  local setmap = vim.api.nvim_set_keymap
  local options = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
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

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#A3A3FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]
