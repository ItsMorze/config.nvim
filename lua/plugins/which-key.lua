return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()

        require("which-key").add({
            { "<leader>c", name = "[C]ode", mode = { "n", "x" } },
            { "<leader>d", name = "[D]ocument" },
            { "<leader>r", name = "[R]ename" },
            { "<leader>s", name = "[S]earch" },
            { "<leader>w", name = "[W]orkspace" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>h", name = "[H]arpoon" },
        })
    end,
}
