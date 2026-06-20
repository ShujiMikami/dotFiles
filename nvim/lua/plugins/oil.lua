return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  view_options = {
    show_hidden = true,
  },
  lazy = false,
  keys = {
    {
      "-",
      "<cmd>Oil --float<cr>",
      desc = "Open oil with floating windw",
    },
  },
}
