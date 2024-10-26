return {
    rust_analyzer = {
        root_dir = require("lspconfig.util").root_pattern("Cargo.toml", ".git"),
        settings = {
            ["rust_analyzer"] = {
                inlayHints = {
                    typeHints = true,
                    parameterHints = true,
                },
                cargo = {
                    allFeatures = true,
                },
            },
        },
    },
}
