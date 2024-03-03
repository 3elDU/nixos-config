return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        override = function(root_dir, library)
          if root_dir:find("/etc/nixos", 1, true) == 1 then
            library.enabled = true
            library.plugins = true
          end
        end,
      }
    },
    -- status updates for lsp
    { "j-hui/fidget.nvim", opts = {}},
  },
  config = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('i', '<C-x>', vim.lsp.omnifunc, opts)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })

    lspconfig.nil_ls.setup {}
    lspconfig.clangd.setup { capabilities = capabilities }
    lspconfig.tailwindcss.setup { capabilities = capabilities }
    lspconfig.tsserver.setup { capabilities = capabilities }
    lspconfig.volar.setup {
      capabilities = capabilities,
      filetypes = {
        'typescript',
        'javascript',
        'vue',
        'json'
      },
    }
    lspconfig.gopls.setup { capabilities = capabilities }
    lspconfig.jsonls.setup { capabilities = capabilities }
    lspconfig.cssls.setup { capabilities = capabilities }
    lspconfig.html.setup { capabilities = capabilities }
    lspconfig.eslint.setup { capabilities = capabilities }

    -- LSP ui configuration
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }

    vim.diagnostic.config({
      virtual_text = {
        prefix = '',
        format = function(diagnostic)
          local icon = ''

          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            icon = signs.Error
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            icon = signs.Warn
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            icon = signs.Info
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            icon = signs.Hint
          end

          return icon .. ' ' .. diagnostic.message
        end
      },
      signs = false,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end
}
