return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require "catppuccin".setup {
      flavour = "macchiato",
      highlight_overrides = { all = function(colors)
        return {
          -- Telescope
          TelescopePromptNormal = { bg = colors.lavender, fg = colors.base },
          TelescopePromptBorder = { bg = colors.lavender, fg = colors.base },
          TelescopePromptCounter = { fg = colors.crust },
          TelescopePromptPrefix = { fg = colors.crust },
          TelescopePromptTitle = { fg = colors.crust, style = {"italic"} },

          TelescopeResultsNormal = { bg = colors.crust, fg = colors.overlay0  },
          TelescopeResultsBorder = { bg = colors.crust },
          TelescopeResultsTitle = { fg = colors.lavender, style = {"italic"} },
          TelescopeMatching = { fg = colors.text, style = {"bold"} },

          TelescopePreviewNormal = { bg = colors.mantle },
          TelescopePreviewBorder = { bg = colors.mantle },
          TelescopePreviewTitle = { fg = colors.lavender, style = {"italic"} },

          -- Neotree
          NeoTreeNormal = { bg = colors.mantle },
          NeoTreeNormalNC = { link = "NeoTreeNormal" },
          NeoTreeWinSeparator = { bg = colors.base, fg = colors.base },
          NeoTreeIndentMarker = { fg = colors.surface0 },
        }
      end },
    }

    vim.cmd("colorscheme catppuccin")
  end
}
