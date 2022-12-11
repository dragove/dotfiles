return function()
  -- use this function notation to build some variables
  local root_markers = { ".git", "mvnw", ".gradlew", "pom.xml", "build.gradle" }
  local root_dir = vim.fs.dirname(vim.fs.find(root_markers)[1])

  -- calculate workspace dir
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

  local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name

  -- get the mason install path
  local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
  local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

  -- get the current OS
  local os
  if vim.fn.has "macunix" then
    os = "mac"
  elseif vim.fn.has "win32" then
    os = "win"
  else
    os = "linux"
  end

  -- return the server config
  return {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-javaagent:" .. install_path .. "/lombok.jar",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      install_path .. "/config_" .. os,
      "-data",
      workspace_dir,
    },
    root_dir = root_dir,
    on_attach = function(client, bufnr)
      require 'jdtls.setup'.add_commands()
      require 'jdtls'.setup_dap()
    end,
    init_options = {
      bundles = {
        vim.fn.glob(debug_install_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
          , 1)
      }
    }
  }
end
