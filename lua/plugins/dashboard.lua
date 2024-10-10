return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        print("hi :)")
        dashboard.section.buttons.val = {
            dashboard.button("r", "  Restore Session", ":lua require('persistence').load()<CR>"),
            dashboard.button("d", "  Open Directory", ":e .<CR>"),
            dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("c", "  Config", ":e " .. vim.fn.stdpath("config") .. "<CR>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("m", "  Mason", ":Mason<CR>"),
            dashboard.button("g", "  DiffView", ":DiffViewOpen<CR>" --[[,{ hl = "TSRainbowOrange" } ]]),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        print("created")

        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        end

        -- Color the header letters
        dashboard.section.header.opts.hl = {
            { { "DiagnosticError", 0, 71 } },
            { { "DiagnosticError", 0, 71 } },
            { { "DiagnosticError", 0, 71 } },
            { { "DiagnosticError", 0, 75 }, { "DiagnosticOk", 46, 50 } },
            { { "DiagnosticError", 0, 121 }, { "DiagnosticOk", 87, 98 } },
            { { "DiagnosticError", 0, 117 } },
            { { "DiagnosticError", 0, 185 } },
            { { "DiagnosticError", 0, 181 } },
            { { "DiagnosticError", 0, 187 } },
            { { "DiagnosticError", 0, 185 } },
            { { "DiagnosticError", 0, 195 } },
            { { "DiagnosticError", 0, 71 } },
            { { "DiagnosticError", 0, 71 } },
            { { "DiagnosticError", 0, 71 } },
        }

        -- Color the buttons icons
        for index, button in ipairs(dashboard.section.buttons.val) do
            dashboard.section.buttons.val[index] =
                vim.tbl_deep_extend("force", button, { opts = { hl = { { "DiagnosticWarn", 0, 3 } } } })
        end

        dashboard.section.footer.opts.hl = "DiagnosticInfo"

        -- Apply the configuration
        alpha.setup(dashboard.opts)

        -- Open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        require("alpha").start(true)
                    end)
                end,
            })
        end
    end,
}
