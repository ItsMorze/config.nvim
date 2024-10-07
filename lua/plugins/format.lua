return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },

    config = function()
        require("conform").setup({
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                stylua = {
                    prepend_args = {
                        "--indent-type=spaces",
                        "--indent-width=4",
                    },
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
            },
        })
    end,
}
