return {
  {
    "linrongbin16/fzfx.nvim",
    keys = {
      { "<leader>ff", "<CMD>FzfxFiles<CR>", { desc = "find files" } },
      { "<leader>fb", "<CMD>FzfxBuffers<CR>", { desc = "find buffers" } },
      { "<leader>fm", "<CMD>FzfxMarks<CR>", { desc = "find marks" } },
      { "<leader>sg", "<CMD>FzfxGLiveGrep<CR>", { desc = "grep search in files" } },
    },
    config = function()
      require("fzfx").setup()
    end,
  },
}
