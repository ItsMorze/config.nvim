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

        require("colorizer").setup()
        vim.api.nvim_set_hl(0, "NonText", { link = "WinSeparator" })
        vim.api.nvim_set_hl(0, "LspInlayHint", { link = "FloatBorder" })

        -- disable italic for comments
        vim.cmd.hi("@comment gui=none")
        vim.cmd.hi("@lsp.type.comment gui=none")
    end,
}
