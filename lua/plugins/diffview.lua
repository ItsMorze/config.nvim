return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",

    config = function()
        local actions = require("diffview.actions")
        require("diffview").setup({
            keymaps = {
                view = {
                    {
                        "n",
                        "<leader>,",
                        actions.conflict_choose("ours"),
                        { desc = "Choose the left version conflict" },
                    },
                    {
                        "n",
                        "<leader>.",
                        actions.conflict_choose("theirs"),
                        { desc = "Choose the right version conflict" },
                    },
                },
            },
        })
    end,

    vim.keymap.set("n", "<leader>dd", function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()

        if view then
            vim.cmd("DiffviewClose")
        else
            vim.cmd("DiffviewOpen")
        end
    end, { desc = "Toggle [D]iffView", silent = true }),
}
