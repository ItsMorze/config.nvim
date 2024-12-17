return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tpope/vim-fugitive",
        "stevearc/oil.nvim",
    },

    config = function()
        local function is_zoomed_in()
            if vim.t["simple-zoom"] == nil then
                return ""
            elseif vim.t["simple-zoom"] == "zoom" then
                return " 󰍉 "
            end
        end

        local mode = {
            "mode",
            fmt = function(str) return " " .. str .. is_zoomed_in() end,
        }

        local filename_section = {
            function() return require("oil").get_current_dir() or "" end,

            {
                "filename",
                newline_status = true,
                symbols = {
                    readonly = "[RO]",
                    unnamed = "",
                },
            },
        }

        local oil_section = {
            function()
                local branch = vim.fn["fugitive#head"]() or ""
                return branch ~= "" and " " .. branch or ""
            end,
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "onedark",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_c = filename_section,
                lualine_x = {
                    oil_section,
                    {
                        ---@diagnostic disable-next-line: undefined-field
                        require("noice").api.status.mode.get,
                        ---@diagnostic disable-next-line: undefined-field
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                },
            },
            inactive_sections = {
                lualine_c = filename_section,
                lualine_x = oil_section,
            },

            extensions = { "lazy", "mason", "fugitive", "man" },
        })
    end,
}
