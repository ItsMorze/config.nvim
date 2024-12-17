return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
        { "<leader>rd", function() require("persistence").stop() end, desc = "[D]on't save current session" },
        { "<leader>rr", function() require("persistence").load() end, desc = "[R]estore session" },
        { "<leader>rs", function() require("persistence").select() end, desc = "[S]elect session" },
        { "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore [L]ast session" },
    },

    opts = {},
}
