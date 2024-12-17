return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lint = require("lint")

        -- TODO: work with the languages folder

        -- vim.list_extend(lint.linters.ruff.args, { "--extend-select", "N,I,C,W605,E1" })

        lint.linters_by_ft = {
            rust = { "clippy" },
            -- python = { "ruff" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function() lint.try_lint() end,
        })
    end,
}
