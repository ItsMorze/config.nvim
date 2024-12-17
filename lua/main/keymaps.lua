local desc = function(desc) return { silent = true, noremap = true, desc = desc } end

vim.keymap.set("n", "<left>", function() vim.notify("Use h to move!!") end)
vim.keymap.set("n", "<right>", function() vim.notify("Use l to move!!") end)
vim.keymap.set("n", "<up>", function() vim.notify("Use k to move!!") end)
vim.keymap.set("n", "<down>", function() vim.notify("Use j to move!!") end)

vim.keymap.set({ "n", "i" }, "<C-s>", function() vim.cmd("w") end, desc("[S]ave Buffer"))

vim.keymap.set({ "n", "i", "v", "x", "o" }, "<C-q>", function() vim.cmd("q") end, desc("[Q]uit Buffer"))

vim.keymap.set("n", "<leader>v", function() vim.cmd("vsplit") end, desc("Split [V]ertically"))
vim.keymap.set("n", "<leader>h", function() vim.cmd("split") end, desc("Split [H]orizontally"))

vim.keymap.set("n", "<Esc>", function() vim.cmd("nohlsearch") end, desc("Remove search highlight"))

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, desc("Next [D]iagnostic"))
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, desc("Previous [D]iagnostic"))
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, desc("Show diagnostic [E]rror messages"))
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, desc("Open diagnostic [Q]uickfix list"))

vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", desc())
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", desc())

vim.keymap.set("n", "n", "nzzzv", desc("Next Search Match"))
vim.keymap.set("n", "N", "Nzzzv", desc("Previous Search Match"))

vim.keymap.set("n", "]t", function() vim.cmd("tabnext") end, desc("Next [T]ab"))
vim.keymap.set("n", "[t", function() vim.cmd("tabprevious") end, desc("Previous [T]ab"))
vim.keymap.set("n", "<leader>to", function() vim.cmd("tabnew") end, desc("Open New [T]ab"))
vim.keymap.set("n", "<leader>tx", function() vim.cmd("tabclose") end, desc("Close Current [T]ab"))

vim.keymap.set("n", "]b", function() vim.cmd("bnext") end, desc("Next [B]uffer"))
vim.keymap.set("n", "[b", function() vim.cmd("bprevious") end, desc("Previous [B]uffer"))
vim.keymap.set("n", "<leader>x", function() vim.cmd("bdelete!") end, desc("Close Buffer"))

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", desc("Exit terminal mode"))

vim.keymap.set({ "n", "v" }, "gy", function()
    local unnamed_reg = vim.fn.getreg('"')
    local clipboard_reg = vim.fn.getreg("*")

    vim.fn.setreg('"', clipboard_reg)
    vim.fn.setreg("*", unnamed_reg)
    vim.print("Registers swapped")
end, desc("Swap between System and Neovim's registers"))

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
