return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tpope/vim-fugitive",
        "stevearc/oil.nvim",
    },

    config = function()
        local mode = {
            "mode",
            fmt = function(str) return " " .. str end,
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
                lualine_x = oil_section,
            },
            inactive_sections = {
                lualine_c = filename_section,
                lualine_x = oil_section,
            },

            extensions = { "lazy", "mason", "fugitive", "man" },
        })
    end,
}
