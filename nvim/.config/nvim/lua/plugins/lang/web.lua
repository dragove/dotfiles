return {
  "yioneko/nvim-vtsls",
  ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  config = function()
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    vim.lsp.enable("vtsls")
  end,
  dependencies = { "neovim/nvim-lspconfig" },
}
