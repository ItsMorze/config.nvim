return {
    -- pyright = {},
    -- black = {},
    -- isort = {},
    -- pylsp = {
    --     settings = {
    --         pylsp = {
    --             plugins = {
    --                 pyflakes = { enabled = false },
    --                 pycodestyle = { enabled = false },
    --                 autopep8 = { enabled = false },
    --                 yapf = { enabled = false },
    --                 mccabe = { enabled = false },
    --                 pylsp_mypy = { enabled = false },
    --                 pylsp_black = { enabled = false },
    --                 pylsp_isort = { enabled = false },
    --             },
    --         },
    --     },
    -- },
    ruff = {
        capabilities = {
            textDocument = {
                hover = {},
            },
        },
        init_options = {
            settings = {
                lint = {
                    extendSelect = { "N", "W605", "E1", "C" },
                    ignore = { "F401", "F841", "F821" },
                },
            },
        },
    },
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "standard",
                },
            },
        },
    },
}
