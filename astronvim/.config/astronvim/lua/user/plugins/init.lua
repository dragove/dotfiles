return {
  ["olimorris/onedarkpro.nvim"] = {},
  ["mfussenegger/nvim-jdtls"] = { module = "jdtls" },
  ["simrat39/rust-tools.nvim"] = {
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
      }
    end,
  }
}
