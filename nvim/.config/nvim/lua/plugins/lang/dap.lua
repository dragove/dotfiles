return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
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
