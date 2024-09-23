return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        local onedark = require("onedark")

        onedark.setup({
            style = "darker",
        })

        onedark.load()

        vim.cmd.hi("Comment gui=none")
    end,
}
