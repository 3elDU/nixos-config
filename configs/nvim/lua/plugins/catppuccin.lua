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

          TelescopeResultsBorder = { bg = colors.mantle },
          TelescopeResultsTitle = { fg = colors.lavender, style = {"italic"} },
          TelescopeResultsNormal = { bg = colors.mantle, fg = colors.overlay0 },
          TelescopeMatching = { fg = colors.text, style = {"bold"} },

          TelescopePreviewNormal = { bg = colors.crust },
          TelescopePreviewBorder = { bg = colors.crust },
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
