return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- Integrate with nvim-notify
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
      progress = {
        -- lsp progress is already configured in lsp.lua by using fidget.nvim
        enabled = false,
      },
      hover = {
        -- Do not show "No information available" notification
        silent = true,
      }
    },
    messages = {
      -- show non-error messages in the bottom right to not distract me with constant
      -- "XXX bytes written" notifications that would cover up the code
      view = "mini",
    },
  },
}
