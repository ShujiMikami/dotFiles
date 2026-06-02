vim.diagnostic.config({
  virtual_text=true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      require("lsp.clangd")
    end,
  },
}
