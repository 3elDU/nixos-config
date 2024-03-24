-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require "lazy".setup({
  -- { import = "plugins.gruvbox" },
  { import = "plugins.catppuccin" },
  { import = "plugins.mini" },
  { import = "plugins.autopairs" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.sleuth" },
  { import = "plugins.comment" },
  { import = "plugins.telescope" },
  { import = "plugins.gitsigns" },
  { import = "plugins.barbar" },
  { import = "plugins.neotree" },
  { import = "plugins.lualine" },
  { import = "plugins.barbecue" },
  { import = "plugins.whichkey" },
  { import = "plugins.markdown"},
  { import = "plugins.dap" },
  { import = "plugins.notify" },
  { import = "plugins.trouble" },
}, {
  defaults = {
    version = false,
  },
})
