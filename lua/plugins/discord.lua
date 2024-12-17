return {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    cmd = "CordConnect",
    opts = {
        editor = {
            tooltip = "Vim but better",
        },
        display = {
            swap_icons = true,
        },
        lsp = {
            show_problem_count = true,
            severity = 2,
        },
    },
}
