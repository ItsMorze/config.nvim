return {
    "supermaven-inc/supermaven-nvim",

    config = function()
        require("supermaven-nvim").setup({
            log_level = "warn",
            disable_inline_completion = false,
        })
    end,
}
