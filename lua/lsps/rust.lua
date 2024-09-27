return {
    rust_analyzer = {
        root_dir = require("lspconfig.util").root_pattern("Cargo.toml", ".git"),
        settings = {
            ["rust_analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
            },
        },
    },
}
