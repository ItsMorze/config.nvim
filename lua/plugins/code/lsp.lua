return {
    {
        "folke/lazydev.nvim",
        ft = "lua",

        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "Mason" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",

            { "j-hui/fidget.nvim", opts = {} },
        },

        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    local telescope = require("telescope.builtin")

                    map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
                    map("gr", telescope.lsp_references, "[G]oto [R]eferences")
                    map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
                    map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("<leader>i", function()
                        local is_enabled = vim.lsp.inlay_hint.is_enabled()
                        vim.lsp.inlay_hint.enable(not is_enabled)
                    end, "Toggle [I]nlay Hints")

                    local client = vim.lsp.get_client_by_id(event.data.client_id)

                    if client and client.name == "ruff" then client.server_capabilities.hoverProvider = false end

                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = require("languages")

            require("mason").setup()
            require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers or {}) })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
