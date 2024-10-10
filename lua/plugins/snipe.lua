return {
    "leath-dub/snipe.nvim",

    config = function()
        local snipe = require("snipe")

        snipe.setup({
            hints = {
                dictionary = "asfghl;wertyuiop",
            },
            navigate = {
                cancel_snipe = "q",
                close_buffer = "d",
            },
        })

        vim.keymap.set("n", "gb", snipe.open_buffer_menu, { desc = "Open [B]uffers Menu" })
    end,
}
