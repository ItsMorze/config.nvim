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
        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end, { desc = "[F]ormat buffer", noremap = true, silent = true })

        require("conform").setup({
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = "never"
                else
                    lsp_format_opt = "fallback"
                end
                return {
                    timeout_ms = 500,
                    lsp_format = lsp_format_opt,
                }
            end,
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
                -- Example for javascript
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        })
    end,
}
