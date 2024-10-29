return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
        { "<leader>rd", function() require("persistence").stop() end, desc = "Don't save current session" },
        { "<leader>rs", function() require("persistence").load() end, desc = "Restore session" },
        { "<leader>rS", function() require("persistence").select() end, desc = "Select session" },
        { "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
    },

    opts = {},
}
