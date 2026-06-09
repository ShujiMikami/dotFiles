vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Goto Definition"
})
keymap.set("n", "K", vim.lsp.buf.hover, {
  desc = "Hover"
})
