return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        cmd = "Telescope",

        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "find files",
            },

            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "live grep",
            },

            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "buffers",
            },

            {
                "<leader>fh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "help",
            },
        },

        opts = {
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "build/",
                },
            },
        },
    },
}
