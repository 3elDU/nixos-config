return {
  "lewis6991/gitsigns.nvim",
  config = true,
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 250,
    },
    signs = {
      add     = { text = '│' },
      change  = { text = '│' },
      delete  = { text = '│' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns;

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Stage/unstage current line
      map('n', '<leader>gs', gs.stage_hunk, {desc = "Stage hunk"})
      map('n', '<leader>gr', gs.reset_hunk, {desc = "Reset hunk"})
      -- Same, but in visual mode
      map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, {desc = "Stage hunk"})
      map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, {desc = "Reset hunk"})
      map('n', '<leader>gu', gs.undo_stage_hunk, {desc = "Undo staging hunk"})
      -- Stage/reset the whole buffer
      map('n', '<leader>gS', gs.stage_buffer, {desc = "Stage buffer"})
      map('n', '<leader>gR', gs.reset_buffer, {desc = "Reset buffer"})
      -- Diff, blame, pewview, deleted
      map('n', '<leader>gd', gs.diffthis, {desc = "Toggle file diff"})
      map('n', '<leader>gp', gs.preview_hunk, {desc = "Preview hunk"})
      map('n', '<leader>gb', function() gs.blame_line { full = true } end, {desc = "Blame line"})
      map('n', '<leader>gd', gs.toggle_deleted, {desc = "Toggle deleted lines"})
    end
  },
}
