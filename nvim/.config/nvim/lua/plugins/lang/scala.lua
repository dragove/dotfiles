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
      showImplicitArguments = false,
      showImplicitConversionsAndClasses = false,
      showInferredType = true,
      serverVersion = "2.0.0-M14",
      serverProperties = { "-Xmx4g" },
      inlayHints = {
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = false },
        implicitConversions = { enable = false },
        inferredTypes = { enable = true },
        typeParameters = { enable = false },
      },
    }
    metals_config.init_options.statusBarProvider = "off"
    metals_config.on_attach = function()
      require("metals").setup_dap()
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
    })
  end,
}
