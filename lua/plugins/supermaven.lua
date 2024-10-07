return {
    "supermaven-inc/supermaven-nvim",

    config = function()
        require("supermaven-nvim").setup({
            log_level = "warn",
        })

        vim.cmd("SupermavenUseFree")
    end,
}
