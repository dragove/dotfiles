return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "oxfmt" },
        javascript = { "oxfmt" },
        typescript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        python = { "ruff" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format()
    end, { desc = "format" })
  end,
}
