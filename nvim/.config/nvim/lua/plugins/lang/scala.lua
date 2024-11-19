return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "nvimdev/guard.nvim",
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
      serverProperties = { "-Dmetals.enable-best-effort=true" },
      inlayHints = {
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = false },
        implicitConversions = { enable = false },
        inferredTypes = { enable = true },
        typeParameters = { enable = false },
      },
    }
    metals_config.init_options.statusBarProvider = "off"
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    metals_config.capabilities = capabilities

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
