return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings = {
      useGlobalExecutable = true,
      showImplicitArguments = false,
      showImplicitConversionsAndClasses = false,
      showInferredType = true,
      superMethodLensesEnabled = false,
      autoImportBuild = "initial",
      serverProperties = {
        "-Xmx2G",
        "-Dmetals.enable-best-effort=true",
        "-XX:+UseZGC",
        "-XX:ZUncommitDelay=30",
        "-XX:ZCollectionInterval=5",
      },
      inlayHints = {
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = false },
        implicitConversions = { enable = false },
        inferredTypes = { enable = true },
        typeParameters = { enable = false },
      },
    }
    metals_config.init_options.statusBarProvider = "off"
    metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
    })
  end,
}
