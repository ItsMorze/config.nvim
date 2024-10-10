return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = false,

    config = function()
        require("Comment").setup()
    end,
}
