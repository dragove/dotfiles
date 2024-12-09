return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "cpp",
        "java",
        "scala",
        "kotlin",
        "groovy",
        "python",
        "javascript",
        "typescript",
      },
      highlight = {
        enable = true
      },
    })
  end,
}
