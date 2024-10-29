return {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
                diagnostics = {
                    disable = { "missing-fields" },
                },
                hint = {
                    enable = true,
                },
            },
        },
    },
    stylua = {},
}
