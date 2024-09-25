return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },

    config = function()
        local ufo = require("ufo")

        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set("n", "zR", ufo.openAllFolds)
        vim.keymap.set("n", "zM", ufo.closeAllFolds)
        vim.keymap.set("n", "zK", function()
            if not ufo.peekFoldedLinesUnderCursor() then
                vim.lsp.buf.hover()
            end
        end, { desc = "Peek Fold" })

        ufo.setup({
            provider_selector = function(_, _, _)
                return { "lsp", "indent" }
            end,
        })
    end,
}
