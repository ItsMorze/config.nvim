return {
    "mfussenegger/nvim-dap",
    keys = {
        { "<F1>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
        { "<F2>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
        { "<F3>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
        { "<F4>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
        { "<F5>", function() require("dap").step_back() end, desc = "Debug: Step Out" },
        { "<F13>", function() require("dap").restart() end, desc = "Debug: Step Out" },
        { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle [B]reakpoint" },
        {
            "<leader>B",
            function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
            desc = "Debug: Set Conditional [B]reakpoint",
        },
        { "<F7>", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
        {
            "<leader>?",
            function() require("dapui").eval(nil, { enter = true }) end,
            desc = "Debug: Evaluate under cursor",
        },
    },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",

        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- Python
        "mfussenegger/nvim-dap-python",
    },
    -- TODO: work with the languages folder
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                "python",
                "codelldb",
                -- "delve",
            },
        })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Install golang specific config
        -- require("dap-go").setup({
        --     delve = {
        --         -- On Windows delve must be run attached or it crashes.
        --         -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        --         detached = vim.fn.has("win32") == 0,
        --     },
        -- })
        require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
    end,
}
