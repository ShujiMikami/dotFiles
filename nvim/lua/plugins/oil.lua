return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },

  dependencies = {
    "nvim-tree/nvim-web-devicons"
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
