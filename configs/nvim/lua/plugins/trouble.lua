return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")

    trouble.setup {
      auto_preview = false,
      use_diagnostic_signs = true,
      focus = true,
      win = {
        wrap = true,
      },
    }
    vim.keymap.set('n', '<leader>wd', function()
        trouble.toggle("diagnostics")
      end,
      { desc = "Toggle workspace diagnostics menu" }
    )
  end
}
