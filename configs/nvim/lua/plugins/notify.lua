return {
  "rcarriga/nvim-notify",
  config = function()
    require "notify".setup {
      icons = {
        DEBUG = "󰃤",
        ERROR = "󰀨",
        INFO = "󰋼",
        TRACE = "󰏫",
        WARN = "󰀦"
      },
      background_colour = "NotifyBackground",
      fps = 20,
      level = 2,
      minimum_width = 16,
      max_width = 64,
      max_height = 50,
      render = "minimal",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 5000,
      top_down = true,
      on_open = function() end,
      on_close = function() end,
    }
    vim.notify = require("notify")
  end
}
