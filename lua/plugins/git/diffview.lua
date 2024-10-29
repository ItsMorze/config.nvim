return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>gd",
            function()
                if require("diffview.lib").get_current_view() then
                    vim.cmd("DiffviewClose")
                else
                    vim.cmd("DiffviewOpen")
                end
            end,
            desc = "Toggle [D]iffview",
        },
    },

    opts = {
        keymaps = {
            view = {
                {
                    "n",
                    "<leader>,",
                    function() require("diffview.actions").conflict_choose("ours") end,
                    { desc = "Choose the left version conflict" },
                },
                {
                    "n",
                    "<leader>.",
                    function() require("diffview.actions").conflict_choose("theirs") end,
                    { desc = "Choose the right version conflict" },
                },
            },
        },
    },
}
