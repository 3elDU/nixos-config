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
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local function map(mode, key, action, description)
          vim.keymap.set(mode, key, action, { buffer = ev.buf, desc = description })
        end

        map('n', 'gD', vim.lsp.buf.declaration, "Go to declaration")
        map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
        map('n', 'K', vim.lsp.buf.hover, "Display hover information about the symbol")
        map('n', 'gi', vim.lsp.buf.implementation, "Go to implementation")
        map('n', '<C-k>', vim.lsp.buf.signature_help, "Show symbol signature")
        map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, "Add path to workspace folders")
        map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, "Remove path from workspace folders")
        map('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List workspace folders")
        map('n', '<space>D', vim.lsp.buf.type_definition, "Go to type definition")
        map('n', '<space>rn', vim.lsp.buf.rename, "Rename symbol")
        map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, "Select code actions")
        map('n', 'gr', vim.lsp.buf.references, "Find references")
        map('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, "Format buffer")
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
    lspconfig.texlab.setup {
      capabilities = capabilities,
      filetypes = { "tex", "plaintex", "bib" },
    }
    lspconfig.rust_analyzer.setup { capabilities = capabilities }

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
