return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
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

    local function get_typescript_server_path(root_dir)
      local global_ts = '/home/akiralaine/.npm/lib/node_modules/typescript/lib'
      local found_ts = ''
      local function check_dir(path)
        found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(root_dir, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end

    local mason_registry = require('mason-registry')

    local function find_files_upwards(starting_dir, target_filenames)
      local function checker(dir)
        for _, filename in ipairs(target_filenames) do
          local target_path = util.path.join(dir, filename)
          if util.path.exists(target_path) then
            return target_path
          end
        end
      end

      return util.search_ancestors(starting_dir, checker)
    end

    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["astro"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
    })

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
      on_attach = on_attach,
      filetypes = { "graphql", "typescriptreact", "javascriptreact", "vue" }
    })

    lspconfig['tsserver'].setup {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server_path,
            languages = { 'vue' },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    }


    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
          vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end
      }
    })

    lspconfig["eslint"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function(fname)
        local root_file = {
          '.eslintrc',
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.yaml',
          '.eslintrc.yml',
          '.eslintrc.json',
          'eslint.config.js',
          'eslint.config.mjs',
          'eslint.config.cjs',
          'eslint.config.ts',
          'eslint.config.mts',
          'eslint.config.cts',
        }

        return find_files_upwards(fname, root_file)
      end
    })

      capabilities = capabilities,
      on_attach = on_attach
    })


    vim.cmd([[
      augroup eslint_format_on_save
      autocmd!
      autocmd BufWritePost *.js,*.ts,*.mts,*.vue,*.graphql,*.astro EslintFixAll
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = "single"
      }
    )

    vim.diagnostic.config{
      float={border="single"}
    }
  end
}
