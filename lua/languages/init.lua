-- TODO: Add support for formatters, linters, snippets, and debuggers (also maybe plugins)
local servers = {}

local current_folder = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

local modules = vim.fs.find(
    function(name) return name:match("%.lua$") end,
    { path = current_folder, limit = math.huge }
)

for _, module in ipairs(modules) do
    local config_name = vim.fn.fnamemodify(module, ":t:r")
    if config_name ~= "init" then
        local ok, config = pcall(require, (...) .. "." .. config_name)
        if ok then
            servers = vim.tbl_deep_extend("force", servers, config)
        else
            vim.notify("Error loading " .. config_name .. " language configuration: " .. config, vim.log.levels.ERROR)
        end
    end
end

return servers
