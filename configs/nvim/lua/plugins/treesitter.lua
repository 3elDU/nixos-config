return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        "lua",
        "nix",
        "c",
        "rust",
        "javascript",
        "typescript",
        "css",
        "html",
        "json",
        "jsonc",
        "bash",
        "jsdoc",
        "markdown",
        "python",
        "toml",
        "vim",
        "yaml",
        "luadoc",
        "markdown_inline",
      },
      auto_install = true,
      highlight = { enable = true },
    }
  end
}
