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
      hover = {
        -- Do not show "No information available" notification
        silent = true,
      }
    }
  },
}
