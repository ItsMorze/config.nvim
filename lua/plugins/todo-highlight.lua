return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "]T", function() require("todo-comments").jump_next() end, desc = "Next [T]ODO Comment" },
        { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous [T]ODO Comment" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        -- BUG: error
        -- HACK: warning
        -- WARNING: warning
        -- TODO: info
        -- NOTE: hint
        -- TESTING: test
        -- PERFORMANCE: default
        colors = {
            default = { "Normal" },
            test = { "Tag" },
        },
    },
}
