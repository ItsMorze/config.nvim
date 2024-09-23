return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "json", "vim", "vimdoc", "bash", "java", "python", "rust" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
