return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      diagnostics = {
        virtual_text=true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      },
    },
    servers = {
      ['*'] = {
        keys = {
          -- jump to definition
          { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },

          -- hover
          { "K", vim.lsp.buf.hover, desc = "Hover" },
        },
      }
    },
    config = function()
      require("lsp.clangd")
    end,
  },
}
