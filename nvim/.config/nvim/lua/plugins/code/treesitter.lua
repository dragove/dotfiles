return {
  'romus204/tree-sitter-manager.nvim', -- requires tree-sitter CLI installed system-wide
  lazy = false,
  config = function()
    require('tree-sitter-manager').setup({
      ensure_installed = {
        "c",
        "cpp",
        "groovy",
        "java",
        "javascript",
        "jsx",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "scala",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "zig",
      },
      highlight = true,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "cpp",
        "groovy",
        "java",
        "javascript",
        "jsx",
        "kotlin",
        "lua",
        "markdown",
        "python",
        "rust",
        "scala",
        "typescript",
        "tsx",
        "vim",
        "zig",
      },
      callback = function()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end,
}
