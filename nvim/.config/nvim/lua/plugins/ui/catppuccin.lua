return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        lsp_saga = true,
        blink_cmp = true,
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
      },
    })
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
}
