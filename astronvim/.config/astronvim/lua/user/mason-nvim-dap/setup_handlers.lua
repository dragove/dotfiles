return {
  cppdbg = function(source_name)
    local dap = require("dap")
    local install_path = require("mason-registry").get_package("cpptools"):get_install_path()
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = install_path .. '/extension/debugAdapters/bin/OpenDebugAD7'
    }
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = "${fileBasenameNoExtension}",
        cwd = '${workspaceFolder}',
        stopAtEntry = false,
      }
    }
  end
}
