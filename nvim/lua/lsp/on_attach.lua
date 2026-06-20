local M = {}

function M.on_attach(_, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true, desc = "Go to definition"})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, silent = true, desc = "Go to declaration"})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, silent = true, desc = "Go to reference"})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true, desc = "Hover"})
end

return M
