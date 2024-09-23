return {
    "ThePrimeagen/harpoon",

    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon [A]dd" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>hh", function()
            ui.nav_file(1)
        end, { desc = "[H]arpoon 1st" })
        vim.keymap.set("n", "<leader>hj", function()
            ui.nav_file(2)
        end, { desc = "[H]arpoon 2nd" })
        vim.keymap.set("n", "<leader>hk", function()
            ui.nav_file(3)
        end, { desc = "[H]arpoon 3rd" })
        vim.keymap.set("n", "<leader>hl", function()
            ui.nav_file(4)
        end, { desc = "[H]arpoon 4th" })
    end,
}
