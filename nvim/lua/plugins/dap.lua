return {
    {
        "mfussenegger/nvim-dap",

        config = function()
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "arm-none-eabi-gdb",
                args = { "--interpreter=dap" },
            }

            dap.configurations.c = {
                {
                    name = "STM32 Debug",
                    type = "gdb",
                    request = "launch",

                    cwd = "${workspaceFolder}",

                    program = function()
                        return vim.fn.input(
                            "ELF: ",
                            vim.fn.getcwd() .. "/build/Debug/",
                            "file"
                        )
                    end,

                    target = "localhost:3333",

                    stopOnEntry = true,
                },
            }

            dap.configurations.cpp = dap.configurations.c
        end,
    },
}
