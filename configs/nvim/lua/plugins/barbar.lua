return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = true,
    tabpages = true,
    clickable = true,
    auto_hide = true,
    icons = {
      button = '',
      gitsigns = {
        added = { enabled = true, icon = '+' },
        changed = { enabled = true, icon = '~' },
        deleted = { enabled = true, icon = '-' },
      }
    },
  },
  config = function ()
    local map = vim.keymap.set

    -- Previous / Next tab
    map('n', '<leader>tt', '<Cmd>BufferNext<CR>')
    map('n', '<leader>tT', '<Cmd>BufferPrevious<CR>')
    -- Reorder current rab
    map('n', '<leader>trt', '<Cmd>BufferMoveNext<CR>')
    map('n', '<leader>trT', '<Cmd>BufferMovePrevious<CR>')
    -- Go to a specific tab
    map('n', '<leader>t1', '<Cmd>BufferGoto 1<CR>')
    map('n', '<leader>t2', '<Cmd>BufferGoto 2<CR>')
    map('n', '<leader>t3', '<Cmd>BufferGoto 3<CR>')
    map('n', '<leader>t4', '<Cmd>BufferGoto 4<CR>')
    map('n', '<leader>t5', '<Cmd>BufferGoto 5<CR>')
    map('n', '<leader>t6', '<Cmd>BufferGoto 6<CR>')
    map('n', '<leader>t7', '<Cmd>BufferGoto 7<CR>')
    map('n', '<leader>t8', '<Cmd>BufferGoto 8<CR>')
    map('n', '<leader>t9', '<Cmd>BufferGoto 9<CR>')
    map('n', '<leader>t0', '<Cmd>BufferLast<CR>')
    -- Pin/unpin buffer
    map('n', '<leader>tp', '<Cmd>BufferPin<CR>')
    -- Close buffer
    map('n', '<leader>c', '<Cmd>BufferClose<CR>')
    -- Enter buffer-picking mode
    map('n', '<leader>tp', '<Cmd>BufferPick<CR>')
    -- Sort tabs by
    map('n', '<leader>tsn', '<Cmd>BufferOrderByBufferNumber<CR>')
    map('n', '<leader>tsd', '<Cmd>BufferOrderByDirectory<CR>')
    map('n', '<leader>tsl', '<Cmd>BufferOrderByLanguage<CR>')
    map('n', '<leader>tsw', '<Cmd>BufferOrderByWindowNumber<CR>')
  end
}
