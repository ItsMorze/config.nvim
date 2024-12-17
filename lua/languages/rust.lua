return {
    rust_analyzer = {
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
        root_dir = require("lspconfig.util").root_pattern("Cargo.toml", ".git"),
        settings = {
            ["rust_analyzer"] = {
                inlayHints = {
                    typeHints = true,
                    parameterHints = true,
                },
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    buildScripts = {
                        enable = true,
                    },
                },
                -- Add clippy lints for Rust.
                checkOnSave = true,
                check = {
                    command = "clippy",
                },
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
            },
        },
    },
}
