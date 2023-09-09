return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "L", vim.diagnostic.open_float, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
        }
      }
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["eslint"].setup({
      capabilities = capabilities,
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
  end
}
