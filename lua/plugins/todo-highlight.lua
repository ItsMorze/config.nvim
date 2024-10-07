return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",

    config = function()
        local todo_comments = require("todo-comments")

        todo_comments.setup({
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
        })

        vim.keymap.set("n", "]t", todo_comments.jump_next, { desc = "Next todo comment" })
        vim.keymap.set("n", "[t", todo_comments.jump_prev, { desc = "Previous todo comment" })
    end,
}
