return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>gh", function() require("gitsigns").preview_hunk() end, desc = "[G]it Preview [H]unk" },
        { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next Git [H]unk" },
        { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous Git [H]unk" },
        { "<leader>gS", function() require("gitsigns").stage_hunk() end, desc = "[G]it [S]tage Hunk" },
        {
            "<leader>gs",
            function()
                local current_line = vim.fn.line(".")
                require("gitsigns").stage_hunk({ current_line, current_line })
            end,
            desc = "[G]it [S]tage line",
        },
        {
            "<leader>gs",
            function()
                local start_line = vim.fn.line("v")
                local end_line = vim.fn.line(".")

                if start_line > end_line then
                    start_line, end_line = end_line, start_line
                end

                require("gitsigns").stage_hunk({ start_line, end_line })
            end,
            mode = "v",
            desc = "[G]it [S]tage selection",
        },
        {
            "<leader>gb",
            function() require("gitsigns").toggle_current_line_blame() end,
            desc = "[G]it Toggle Current Line [B]lame",
        },
    },

    config = function()
        require("gitsigns").setup({
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
                ignore_whitespace = true,
            },
        })

        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
    end,
}
