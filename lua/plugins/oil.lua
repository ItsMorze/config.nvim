return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            defualt_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,

            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },

            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-c>"] = false,
                ["q"] = "actions.close",
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Go to parent directory" })
    end,
}
