return {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
  version = false,
  config = function ()
    require "mini.ai".setup {}
    require "mini.surround".setup {
      highlight_duration = 1500,
    }
    require "mini.align".setup {}
  end
}
