return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require"neo-tree".setup({
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true }},
        }
      },
      filesystem = {
        hijack_netrw_bahavior = "open_default" -- use neotree instead of netrw
      },
      default_component_configs = {
        modified = {
          symbol = "+"
        },
        icon = {
          folder_closed = "󰉋",
          folder_open = "󰝰",
          folder_empty = "󰉋",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "󱀷",
            renamed = "󱀱",
            unstaged = "󱀶",
            staged = "󰄬",
            conflict = "󰩌",
          }
        }
      }
    })

    vim.keymap.set('n', '<space>e', "<cmd>Neotree reveal<cr>")
    vim.keymap.set('n', '<space>E', "<cmd>Neotree close<cr>")
  end
}
