return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Go to parent directory" },
    },

    opts = {
        defualt_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        win_options = {
            wrap = true,
        },

        view_options = {
            is_hidden_file = function(name, _) return name == ".." or name == ".git" or name == ".DS_Store" end,
        },

        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-c>"] = false,
            ["q"] = "actions.close",
        },
    },
}
