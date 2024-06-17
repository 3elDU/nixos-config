return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- base16 colors
    local basesixteen = require "colors"

    require "catppuccin".setup {
      flavour = "macchiato",
      color_overrides = {
        all = {
          base = basesixteen.base00,
          mantle = basesixteen.base01,
          crust = basesixteen.base01,
          surface0 = basesixteen.base02,
          surface1 = basesixteen.base03,
          surface2 = basesixteen.base04,
          overlay0 = basesixteen.base04,
          overlay1 = basesixteen.base04,
          overlay2 = basesixteen.base05,
          subtext0 = basesixteen.base05,
          subtext1 = basesixteen.base05,
          text = basesixteen.base05,
          rosewater = basesixteen.base06,
          lavender = basesixteen.base07,
          red = basesixteen.base08,
          maroon = basesixteen.base08,
          peach = basesixteen.base09,
          yellow = basesixteen.base0A,
          green = basesixteen.base0B,
          teal = basesixteen.base0C,
          sky = basesixteen.base0D,
          sapphire = basesixteen.base0D,
          blue = basesixteen.base0D,
          mauve = basesixteen.base0E,
          pink = basesixteen.base0F,
          flamingo = basesixteen.base0F,
        },
      },
      highlight_overrides = { all = function(colors)
        return {
          -- Telescope
          TelescopePromptNormal = { bg = colors.lavender, fg = colors.base },
          TelescopePromptBorder = { bg = colors.lavender, fg = colors.base },
          TelescopePromptCounter = { fg = colors.crust },
          TelescopePromptPrefix = { fg = colors.crust },
          TelescopePromptTitle = { fg = colors.crust, style = { "italic" } },

          TelescopeResultsNormal = { bg = colors.crust, fg = colors.overlay0 },
          TelescopeResultsBorder = { bg = colors.crust },
          TelescopeResultsTitle = { fg = colors.lavender, style = { "italic" } },
          TelescopeMatching = { fg = colors.text, style = { "bold" } },

          TelescopePreviewNormal = { bg = colors.mantle },
          TelescopePreviewBorder = { bg = colors.mantle },
          TelescopePreviewTitle = { fg = colors.lavender, style = { "italic" } },

          -- Neotree
          NeoTreeNormal = { bg = colors.mantle },
          NeoTreeNormalNC = { link = "NeoTreeNormal" },
          NeoTreeWinSeparator = { bg = colors.base, fg = colors.base },
          NeoTreeIndentMarker = { fg = colors.surface0 },

          -- Barbar
          BufferCurrentIndex = { fg = colors.text, bg = colors.surface1 }
        }
      end },
    }

    vim.cmd("colorscheme catppuccin")
  end
}
