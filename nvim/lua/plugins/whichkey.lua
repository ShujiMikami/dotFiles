return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        opts = {
            preset = "modern",

            delay = 300,

            icons = {
                mappings = true,
            },

            spec = {
                {
                    "<leader>f",
                    group = "find",
                },

                {
                    "<leader>g",
                    group = "git",
                },

                {
                    "<leader>c",
                    group = "code",
                },

                {
                    "<leader>l",
                    group = "lsp",
                },

                {
                    "<leader>w",
                    group = "window",
                },
            },
        },
    },
}
