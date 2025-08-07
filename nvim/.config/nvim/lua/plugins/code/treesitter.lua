return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })
    require("nvim-treesitter").install({
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
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "cpp",
        "groovy",
        "java",
        "javascript",
        "kotlin",
        "lua",
        "markdown",
        "python",
        "rust",
        "scala",
        "typescript",
        "vim",
        "zig",
      },
      callback = function()
        vim.treesitter.start()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
