return {
  "utilyre/barbecue.nvim",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      opts = {
        lsp = {
          preference = { "tsserver", "volar", "tailwindcss" }
        }
      }
    },
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
  }
}
