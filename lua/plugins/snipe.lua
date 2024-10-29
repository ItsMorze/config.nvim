return {
    "leath-dub/snipe.nvim",
    keys = {
        { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open [B]uffers Menu" },
    },

    opts = {
        hints = {
            dictionary = "asfghl;wertyuiop",
        },
        navigate = {
            cancel_snipe = "q",
            close_buffer = "d",
        },
    },
}
