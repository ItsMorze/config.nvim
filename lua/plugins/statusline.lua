return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tpope/vim-fugitive",
    },

    config = function()
        local filename_section = {
            function()
                return require("oil").get_current_dir() or ""
            end,

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
                theme = "onedark",
            },
            sections = {
                lualine_c = filename_section,
                lualine_x = oil_section,
            },
            inactive_sections = {
                lualine_c = filename_section,
                lualine_x = oil_section,
            },

            extensions = { "lazy", "mason", "fugitive" }, -- Make sure 'fugitive' is listed here
        })
    end,
}
