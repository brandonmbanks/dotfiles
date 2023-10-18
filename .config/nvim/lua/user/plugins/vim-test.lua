return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>tt", ":TestNearest<cr>")
    vim.keymap.set("n", "<leader>tT", ":TestFile<cr>")
    vim.keymap.set("n", "<leader>ta", ":TestSuite<cr>")
    vim.keymap.set("n", "<leader>tl", ":TestLast<cr>")
    vim.keymap.set("n", "<leader>tg", ":TestVisit<cr>")
  end,
}
