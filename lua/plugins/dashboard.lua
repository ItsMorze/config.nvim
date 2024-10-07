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

        dashboard.section.buttons.val = {
            dashboard.button("r", "  Restore Session", ":lua require('persistence').load()<CR>"),
            dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("c", "  Config", ":e " .. vim.fn.stdpath("config") .. "<CR>"),
            dashboard.button("m", "  Mason", ":Mason<CR>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("g", "  LazyGit", ":LazyGit<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        end

        -- Set colors for header, buttons, and footer
        dashboard.section.header.opts.hl = "DashboardHeader"
        dashboard.section.buttons.opts.hl = "DashboardCenter"
        dashboard.section.footer.opts.hl = "DashboardFooter"

        -- Apply the configuration
        alpha.setup(dashboard.opts)

        vim.cmd([[
            highlight DashboardHeader guifg=#ff79c6
            highlight DashboardCenter guifg=#8be9fd
            highlight DashboardFooter guifg=#50fa7b
        ]])

        -- open dashboard after closing lazy
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
