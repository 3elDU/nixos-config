return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    -- Always open browser in new window
    vim.cmd([[
      :function! MkdpOpenInNewWindow(url)
      :  silent execute "!firefox --new-window " .. a:url
      :endfunction
    ]])
    vim.g.mkdp_browserfunc = "MkdpOpenInNewWindow"

    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_combine_preview = 1
    -- Automatically switch markdown preview when switching buffers
    vim.g.mkdp_combine_preview_auto_refresh = 1

    vim.keymap.set('n', '<leader>p', "<cmd>MarkdownPreviewToggle<cr>", {desc = "Toggle markdown preview"})
  end
}
