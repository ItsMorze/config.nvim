vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.showmode = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { tab = ">>", trail = "·", nbsp = "+", eol = "↵" }

vim.opt.diffopt:append({ "followwrap" })
vim.opt.fillchars = { diff = "╱" }

vim.opt.hlsearch = true
vim.opt.inccommand = "split"

vim.opt.signcolumn = "auto:2"

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.opt.mouse = "a"

vim.opt.undofile = true

local colorterm = os.getenv("COLORTERM")
vim.opt.termguicolors = (colorterm == "truecolor" or colorterm == "24bit")

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
