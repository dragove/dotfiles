return {
  "saghen/blink.cmp",
  version = "v0.*",
  lazy = false,
  opts = {
    keymap = { preset = "enter" },
    nerd_font_variant = "mono",
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
