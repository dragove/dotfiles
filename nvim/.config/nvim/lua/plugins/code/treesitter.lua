return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = true,
      auto_install = false,
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
