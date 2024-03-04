return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function ()
    require"barbar".setup {
      animation = true,
      tabpages = true,
      clickable = true,
      focus_on_close = 'previous',
      icons = {
        buffer_index = true,
        button = '',
        separator = {
          left = '',
          right = '',
        },
        separator_at_end = false,
        modified = { button = '' },
        inactive = {
          separator = {
            left = '',
          }
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        }
      },
    }

    local map = vim.keymap.set

    -- Previous / Next tab
    map('n', '<leader>tt', '<Cmd>BufferNext<CR>', {desc = "Next tab"})
    map('n', '<leader>tT', '<Cmd>BufferPrevious<CR>', {desc = "Previous tab"})
    -- Reorder current rab
    map('n', '<leader>trt', '<Cmd>BufferMoveNext<CR>', {desc = "Swap current tab with next"})
    map('n', '<leader>trT', '<Cmd>BufferMovePrevious<CR>', {desc = "Swap current tab with previous"})
    -- Go to a specific tab
    map('n', '<leader>t1', '<Cmd>BufferGoto 1<CR>', {desc = "Go to 1st tab"})
    map('n', '<leader>t2', '<Cmd>BufferGoto 2<CR>', {desc = "Go to 2nd tab"})
    map('n', '<leader>t3', '<Cmd>BufferGoto 3<CR>', {desc = "Go to 3rd tab"})
    map('n', '<leader>t4', '<Cmd>BufferGoto 4<CR>', {desc = "Go to 4th tab"})
    map('n', '<leader>t5', '<Cmd>BufferGoto 5<CR>', {desc = "Go to 5th tab"})
    map('n', '<leader>t6', '<Cmd>BufferGoto 6<CR>', {desc = "Go to 6th tab"})
    map('n', '<leader>t7', '<Cmd>BufferGoto 7<CR>', {desc = "Go to 7th tab"})
    map('n', '<leader>t8', '<Cmd>BufferGoto 8<CR>', {desc = "Go to 8th tab"})
    map('n', '<leader>t9', '<Cmd>BufferGoto 9<CR>', {desc = "Go to 9th tab"})
    map('n', '<leader>t0', '<Cmd>BufferLast<CR>', {desc = "Go to the last tab"})
    -- Pin/unpin buffer
    map('n', '<leader>tp', '<Cmd>BufferPin<CR>', {desc = "Pin current buffer"})
    -- Close buffer
    map('n', '<leader>c', '<Cmd>BufferClose<CR>', {desc = "Close current buffer"})
    -- Enter buffer-picking mode
    map('n', '<leader>tj', '<Cmd>BufferPick<CR>', {desc = "Enter buffer-picking mode"})
    -- Sort tabs by
    map('n', '<leader>tsn', '<Cmd>BufferOrderByBufferNumber<CR>', {desc = "Sort tabs by buffer number"})
    map('n', '<leader>tsd', '<Cmd>BufferOrderByDirectory<CR>', {desc = "Sort tabs by directory"})
    map('n', '<leader>tsl', '<Cmd>BufferOrderByLanguage<CR>', {desc = "Sort tabs by language"})
    map('n', '<leader>tsw', '<Cmd>BufferOrderByWindowNumber<CR>', {desc = "Sort tabs by window number"})
  end
}
