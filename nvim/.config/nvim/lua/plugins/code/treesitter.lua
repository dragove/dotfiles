return {
  "romus204/tree-sitter-manager.nvim",
  lazy = false,
  config = function()
    require("tree-sitter-manager").setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "groovy",
        "java",
        "javascript",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "scala",
        "typescript",
        "vim",
        "vimdoc",
        "zig",
      }
    })
  end,
}
