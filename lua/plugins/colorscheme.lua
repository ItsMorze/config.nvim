return {
    "navarasu/onedark.nvim",
    dependencies = { "norcalli/nvim-colorizer.lua" },
    lazy = false,
    priority = 1000,

    config = function()
        local onedark = require("onedark")

        onedark.setup({
            style = "darker",
        })

        onedark.load()

        vim.cmd.hi("Comment gui=none")

        require("colorizer").setup()
    end,
}
