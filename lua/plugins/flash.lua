return {
    "folke/flash.nvim",
    event = "VeryLazy",

    config = function()
        local flash = require("flash")

        flash.setup({
            jump = {
                autojump = true,
            },
            modes = {
                char = {
                    jump_labels = true,
                    multi_line = false,
                },
            },
        })

        vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
        vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
        vim.keymap.set("o", "r", flash.remote, { desc = "Remote Flash" })
        vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
    end,
}
