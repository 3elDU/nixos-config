return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require "neo-tree".setup({
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

    vim.keymap.set('n', '<space>e', "<cmd>Neotree reveal toggle=true<cr>", { desc = "Toggle neotree visibility" })
    vim.keymap.set('n', '<space>E', "<cmd>Neotree close<cr>", { desc = "Hide neotree" })
  end
}
