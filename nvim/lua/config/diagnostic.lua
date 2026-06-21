vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error in float window"})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Show previous error"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Show next error"})
