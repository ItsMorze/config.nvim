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

        vim.api.nvim_set_hl(0, "NonText", { link = "WinSeparator" })
        vim.api.nvim_set_hl(0, "LspInlayHint", { link = "FloatBorder" })

	-- change highlight groups for neogit
        vim.api.nvim_set_hl(0, "Error", { link = "TSRainbowRed" })
        vim.api.nvim_set_hl(0, "SpecialChar", { link = "TSRainbowOrange" })
        vim.api.nvim_set_hl(0, "PreProc", { link = "TSRainbowYellow" })
        vim.api.nvim_set_hl(0, "String", { link = "TSRainbowGreen" })
        vim.api.nvim_set_hl(0, "Operator", { link = "TSRainbowCyan" })
        vim.api.nvim_set_hl(0, "Macro", { link = "TSRainbowBlue" })
        vim.api.nvim_set_hl(0, "Include", { link = "TSRainbowViolet" })

        -- disable italic for comments
        vim.cmd.hi("@comment gui=none")
        vim.cmd.hi("@lsp.type.comment gui=none")
    end,
}
