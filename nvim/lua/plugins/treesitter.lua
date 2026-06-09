return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "yaml",
            "cmake",
            "make",
            "markdown",
            "markdown_inline",
        },

        auto_install = true,

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },
    },
}
