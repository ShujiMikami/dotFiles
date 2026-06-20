local on_attach = require("lsp.on_attach").on_attach

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu"
  },

  on_attach = on_attach,
})

vim.lsp.enable("clangd")
