return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require "lualine".setup {
      options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          -- Do not show statusline for neotree
          statusline = { 'neo-tree', 'Trouble', 'qf' }
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'filetype', icon_only = true },
          'filename'
        },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { { 'branch', icon = '󰘬' } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      }
    }
  end
}
