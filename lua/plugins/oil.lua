return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end,
}
