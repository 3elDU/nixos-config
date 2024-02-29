return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup {
      transparent_mode = true
    }
    vim.api.nvim_command("colorscheme gruvbox")
  end
}
