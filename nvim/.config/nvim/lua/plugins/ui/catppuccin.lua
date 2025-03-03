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
        snacks = {
          enabled = false,
          indent_scope_color = "lavender",
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
