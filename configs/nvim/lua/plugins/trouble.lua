return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup {
      auto_preview = false,
      use_diagnostic_signs = true,
    }
    vim.keymap.set('n', '<leader>wd', function()
        require("trouble").toggle("diagnostics")
      end,
      { desc = "Toggle workspace diagnostics menu" }
    )
  end
}
