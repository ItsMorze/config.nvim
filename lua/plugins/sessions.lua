return {
    "folke/persistence.nvim",
    event = "BufReadPre",

    config = function()
        local persistence = require("persistence")
        persistence.setup({})

        vim.keymap.set("n", "<leader>rd", persistence.stop, { desc = "Don't save current session" })
        vim.keymap.set("n", "<leader>rs", persistence.load, { desc = "Restore session" })
        vim.keymap.set("n", "<leader>rS", persistence.select, { desc = "Select session" })
        vim.keymap.set("n", "<leader>rl", function()
            persistence.load({ last = true })
        end, { desc = "Restore last session" })
    end,
}
