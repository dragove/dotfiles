return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "biome" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        python = { "ruff" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format()
    end, { desc = "format" })
  end,
}
