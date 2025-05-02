return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = "executable",
      command = "lldb-dap",
      name = "lldb",
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }

    require("nvim-dap-virtual-text").setup({
      clear_on_continue = true,
      display_callback = function(variable)
        if #variable.value > 15 then
          return " " .. variable.value:sub(1, 15) .. "..."
        end
        return " " .. variable.value
      end,
    })

    local map = vim.keymap.set
    map("n", "<leader>dc", function()
      require("dap").continue()
    end)

    map("n", "<leader>dr", function()
      require("dap").repl.toggle()
    end)

    map("n", "<leader>dt", function()
      require("dap").toggle_breakpoint()
    end)

    map("n", "<leader>dso", function()
      require("dap").step_over()
    end)

    map("n", "<leader>dsi", function()
      require("dap").step_into()
    end)

    map("n", "<leader>dl", function()
      require("dap").run_last()
    end)
  end,
}
