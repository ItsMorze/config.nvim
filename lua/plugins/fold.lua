return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    keys = {
        { "zR", function() require("ufo").openAllFolds() end },
        { "zM", function() require("ufo").closeAllFolds() end },
        {
            "zK",
            function()
                if not require("ufo").peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end
            end,
            desc = "Peek Fold",
        },
    },
    dependencies = {
        "kevinhwang91/promise-async",
    },

    config = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true

        require("ufo").setup({
            provider_selector = function(_, _, _) return { "lsp", "indent" } end,
        })
    end,
}
