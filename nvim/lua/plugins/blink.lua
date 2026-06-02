return {
    {
        "saghen/blink.cmp",

        version = "*",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        opts = {
            keymap = {
                preset = "enter",
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "buffer",
                },
            },
        },
    },
}
