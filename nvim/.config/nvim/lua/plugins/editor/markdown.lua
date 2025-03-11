return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      position = "inline",
      backgrounds = {
        "none",
        "none",
        "none",
        "none",
        "none",
        "none",
      },
    },
    code = {
      border = "thick",
      width = "block",
      language_pad = 1,
      left_pad = 1,
      right_pad = 1,
    },
    inline_highlight = {
      enabled = false,
    },
  },
}
