return {
    {
        "supermaven-inc/supermaven-nvim",
        event = { "InsertEnter", "CmdlineEnter" },

        opts = {
            log_level = "warn",
            disable_inline_completion = true,
            disable_keymaps = true,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then return end
                    return "make install_jsregexp"
                end)(),
            },
            "saadparwaiz1/cmp_luasnip",

            "onsails/lspkind-nvim",
            { "brenoprata10/nvim-highlight-colors", opts = {} },
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },

                completion = { completeopt = "menu,menuone,noinsert" },

                experimental = {
                    ghost_text = true,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-c>"] = cmp.mapping.complete({}),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
                    end, { "i", "s" }),
                }),

                formatting = {
                    format = function(entry, item)
                        local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
                        item = require("lspkind").cmp_format({
                            mode = "symbol",
                            maxwidth = 50,
                            ellipsis_char = "...",
                            show_labelDetails = true,
                            symbol_map = { Supermaven = "" },
                        })(entry, item)

                        if color_item.abbr_hl_group then
                            item.kind_hl_group = color_item.abbr_hl_group
                            item.kind = color_item.abbr
                        end
                        return item
                    end,
                },

                sources = {
                    { name = "lazydev", group_index = 0 },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "supermaven" },
                },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })
        end,
    },
}
