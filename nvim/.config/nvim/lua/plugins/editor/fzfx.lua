return {
   {
    "linrongbin16/fzfx.nvim",
    keys = {
        {"<leader>ff", "<CMD>FzfxFiles<CR>", {desc = "find files"}}
    },
    config = function()
      require("fzfx").setup()
    end,
   }
}
