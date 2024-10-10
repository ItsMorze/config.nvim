return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },

            numhl = true,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 100,
            },
        })

        local next_hunk = function()
            gitsigns.nav_hunk("next")
        end

        local prev_hunk = function()
            gitsigns.nav_hunk("prev")
        end

        local stage_line = function()
            local current_line = vim.fn.line(".")
            gitsigns.stage_hunk({ current_line, current_line })
        end

        local stage_selection = function()
            local start_line = vim.fn.line("v")
            local end_line = vim.fn.line(".")

            if start_line > end_line then
                start_line, end_line = end_line, start_line
            end

            gitsigns.stage_hunk({ start_line, end_line })
        end

        vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk, { desc = "[G]it Preview [H]unk" })
        vim.keymap.set("n", "]h", next_hunk, { desc = "Next Git [H]unk" })
        vim.keymap.set("n", "[h", prev_hunk, { desc = "Previous Git [H]unk" })
        vim.keymap.set("n", "<leader>gs", stage_line, { desc = "[G]it [S]tage line" })
        vim.keymap.set("v", "<leader>gs", stage_selection, { desc = "[G]it [S]tage selection" })
        vim.keymap.set("n", "<leader>gS", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
    end,
}
