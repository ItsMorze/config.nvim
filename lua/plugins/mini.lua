return {
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",

        opts = {
            n_lines = 500,
        },
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",

        opts = {
            n_lines = 200,
        },
    },
    {
        "echasnovski/mini.splitjoin",
        event = "VeryLazy",

        opts = {
            mappings = { toggle = "gs" },
        },
    },
    {
        "echasnovski/mini.indentscope",
        event = "VeryLazy",

        opts = {
            draw = {
                animation = function() return 0 end,
            },
            symbol = "│",
            options = {
                try_as_border = true,
            },
        },
    },
}
