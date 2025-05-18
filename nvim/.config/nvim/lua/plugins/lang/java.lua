return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  config = function()
    local home = os.getenv("HOME")
    local root_markers = { "gradlew", ".git", "mvnw", "pom.xml" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-1.8",
              path = "/usr/lib/jvm/java-8-openjdk/",
            },
            {
              name = "JavaSE-17",
              path = "/usr/lib/jvm/java-17-openjdk/",
            },
            {
              name = "JavaSE-21",
              path = "/usr/lib/jvm/java-21-openjdk/",
            },
            {
              name = "JavaSE-24",
              path = "/usr/lib/jvm/java-24-openjdk/",
            },
          },
        },
      },
    }
    local function attach_jdtls()
      local config = {
        cmd = { "jdtls", "-data", workspace_folder },
        root_dir = root_dir,
        init_options = {
          bundles = {},
        },
        settings = settings
      }
      require("jdtls").start_or_attach(config)
    end
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = attach_jdtls,
    })
    attach_jdtls()
  end,
}
