return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = false,
      integrations = {
        lsp_saga = true,
        blink_cmp = true,
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
      },
      custom_highlights = function(color)
        return {
          NormalFloat = { fg = color.text, bg = color.none },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
}
