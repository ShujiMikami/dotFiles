
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lsp.clangd")
  end,
}
