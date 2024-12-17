return {
    {
        "nvim-treesitter/playground",
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",

        opts = {
            max_lines = 1,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPre",
        build = ":TSUpdate",

        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "commonlisp",
                    "cpp",
                    "diff",
                    "git_config",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                    "go",
                    "java",
                    "json",
                    "latex",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "nix",
                    "python",
                    "rust",
                    "toml",
                    "tmux",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "zig",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
