return {
    "fasterius/simple-zoom.nvim",
    cmd = { "SimpleZoomToggle" },
    keys = {
        { "<leader>z", function() require("simple-zoom").toggle_zoom() end, desc = "Toggle [Z]oom" },
    },

    opts = {
        hide_tabline = true,
    },
}
