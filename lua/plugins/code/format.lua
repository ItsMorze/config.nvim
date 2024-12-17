return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function() require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 500 }) end,
            desc = "[F]ormat buffer",
        },
    },

    opts = {
        notify_on_error = true,
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
        -- TODO: work with the languages folder
        formatters = {
            stylua = {
                prepend_args = {
                    "--indent-type=spaces",
                    "--indent-width=4",
                },
            },

            --Custom
            ruff_fix = {
                command = "ruff",
                args = { "check", "--fix", "-n", "-e", "--stdin-filename", "$FILENAME", "-", "--extend-select", "I" },
                stdin = true,
            },
            ruff_format = {
                command = "ruff",
                args = { "format", "-n", "--stdin-filename", "$FILENAME", "-" },
                stdin = true,
            },
            -- clippy_fix = {
            --     command = "cargo",
            --     args = { "clippy", "--fix", "--allow-dirty" },
            --     stdin = false,
            -- },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_fix" },
        },
    },
}
