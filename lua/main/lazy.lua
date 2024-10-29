local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

---@overload fun(folder: string)
local function import(folder)
    local specs = { { import = folder } }

    -- iterate over all inner folders
    for name, type in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/" .. folder) do
        if type == "directory" then table.insert(specs, { import = folder .. "." .. name }) end
    end

    return specs
end

require("lazy").setup(import("plugins"), {
    install = {
        colorscheme = { "onedark" },
    },
    change_detection = {
        notify = false,
    },
})
