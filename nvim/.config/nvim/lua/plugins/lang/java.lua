return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  config = function()
    vim.lsp.config("jdtls", {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = "/usr/lib/jvm/java-8-openjdk/",
              },
              {
                name = "JavaSE-21",
                path = "/usr/lib/jvm/java-21-openjdk/",
              },
              {
                name = "JavaSE-25",
                path = "/usr/lib/jvm/java-25-openjdk/",
              },
            },
          },
        }
      }
    })
    vim.lsp.enable("jdtls")
  end,
}
