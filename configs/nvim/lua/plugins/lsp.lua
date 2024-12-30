local function find_vue_typescript_plugin_path()
  local mason_registry = require("mason-registry")
  return mason_registry.get_package('vue-language-server'):get_install_path()
      .. '/node_modules/@vue/language-server'
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        }
      },
      dependencies = {
        { "Bilal2453/luvit-meta", lazy = true }
      }
    },
    -- status updates for lsp
    { "j-hui/fidget.nvim", opts = {} },
    -- Rust support
    {
      "mrcjkb/rustaceanvim",
      filetypes = "rust",
      version = '^4',
      lazy = false,
    },
    -- download LSP / DAP servers automagically
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },
  opts = {
    inlay_hints = {
      enable = true
    },
    init_options = {
      userLanguages = {
        -- yew.rs support
        rust = "html",
      }
    }
  },
  config = function()
    local lspconfig = require("lspconfig")
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "volar",
      },
      automatic_installation = true,
    })

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local function map(mode, key, action, description)
          vim.keymap.set(mode, key, action, { buffer = ev.buf, desc = description })
        end

        vim.lsp.inlay_hint.enable(true, {
          bufnr = ev.buf
        })

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
        map({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, "Select code actions")
        map('n', 'gr', vim.lsp.buf.references, "Find references")
        map('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, "Format buffer")
      end
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
    local function setup_server(name, opts)
      opts = opts or {}
      opts.capabilities = capabilities

      lspconfig[name].setup(opts)
    end
    local function setup_servers(names)
      for _, name in pairs(names) do
        setup_server(name)
      end
    end

    setup_server("lua_ls", {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })

    setup_server("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = find_vue_typescript_plugin_path(),
            languages = { "vue" },
          }
        }
      },
      filetypes = {
        "javascript",
        "typescript",
        "vue",
      }
    })

    setup_servers({
      "clangd",
      "gopls",
      "jsonls",
      "cssls",
      "html",
      "eslint",
      "intelephense",
      "tailwindcss",
    })

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
      -- update_in_insert = true,
      severity_sort = true,
    })

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end
}
