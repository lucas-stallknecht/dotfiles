return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local executable_path = nil

            local dap = require "dap"
            local ui = require "dapui"
            require("dapui").setup()


            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-dap',
                name = 'lldb'
            }

            dap.configurations.cpp = {
                {
                    name = "Debug with lldb-dap",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        if executable_path == nil then
                            executable_path = vim.fn.input('Path to executable: ', vim.fn.getcwd(), 'file')
                        else
                            executable_path = vim.fn.input('Path to executable: ', executable_path, 'file')
                        end
                        return executable_path;
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = false, -- set to true if you want to debug in external terminal
                },
            }
            dap.configurations.c = dap.configurations.cpp

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "[B]reakpoint" })

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "[D]ap [R]un" })
            vim.keymap.set("n", "<leader>ds", dap.close, { desc = "[D]ap [S]top" })

            vim.keymap.set("n", "<Right>", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "<Down>", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<Up>", dap.restart, { desc = "Restart" })

            vim.keymap.set("n", "<leader>td", ui.toggle);
        end,
    }
}
