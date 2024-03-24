return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup{
      defaults = {
        borderchars = { "" },
      }
    }

    local builtin = require("telescope.builtin")
    local telescope = require("telescope")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffers"})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})
    vim.keymap.set('n', '<leader>fH', builtin.highlights, {desc = "Find highlight groups"})
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = "Find diagnostics"})
    vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, {desc = "Find symbols in current workspace"})
    vim.keymap.set('n', '<leader>fn', telescope.extensions.notify.notify, {desc = "Search through notification history"})
  end
}
