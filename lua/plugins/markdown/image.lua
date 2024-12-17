return {
    "3rd/image.nvim",
    lazy = true, -- should only be loaded when manually calling `:Lazy load image.nvim`

    -- for now enable only on macOS
    -- FIXME: add support for Linux & Windows
    cond = vim.uv.os_uname().sysname == "Darwin",

    dependencies = {
        {
            "vhyrro/luarocks.nvim",
            priority = 1001,

            opts = {
                rocks = { "magick" },
            },
        },
    },

    opts = {
        backend = "kitty",
        kitty_method = "normal",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = true,
                filetypes = { "markdown", "vimwiki" },
            },
            neorg = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "norg" },
            },
            html = {
                enabled = true,
            },
            css = {
                enabled = true,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,

        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },

        editor_only_render_when_focused = true,
        tmux_show_only_in_active_window = true,

        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
}
