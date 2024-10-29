return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()

        require("which-key").add({
            { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>r", group = "[R] Session" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>g", group = "[G]it" },
        })
    end,
}
