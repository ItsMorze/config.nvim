return {
    "chrishrb/gx.nvim",
    cmd = { "Browse" },
    keys = {
        { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } },
    },
    init = function() vim.g.netrw_nogx = 1 end,
    submodules = false,

    opts = {
        handlers = {
            rust = {
                name = "rust",
                filetype = { "toml" },
                filename = "Cargo.toml",
                handle = function(mode, line, _)
                    local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

                    if crate then return "https://crates.io/crates/" .. crate end
                end,
            },
        },
    },
}
