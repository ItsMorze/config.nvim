return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },

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
