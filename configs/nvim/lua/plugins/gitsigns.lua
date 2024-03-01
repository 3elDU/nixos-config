return {
  "lewis6991/gitsigns.nvim",
  config = true,
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 250,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns;

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Stage/unstage current line
      map('n', '<leader>gs', gs.stage_hunk)
      map('n', '<leader>gr', gs.reset_hunk)
      -- Same, but in visual mode
      map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
      map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
      map('n', '<leader>gu', gs.undo_stage_hunk)
      -- Stage/reset the whole buffer
      map('n', '<leader>gS', gs.stage_buffer)
      map('n', '<leader>gR', gs.reset_buffer)
      -- Diff, blame, pewview, deleted
      map('n', '<leader>gd', gs.diffthis)
      map('n', '<leader>gp', gs.preview_hunk)
      map('n', '<leader>gb', function() gs.blame_line { full = true } end)
      map('n', '<leader>gd', gs.toggle_deleted)
    end
  },
}
