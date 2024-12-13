return {
  "saghen/blink.cmp",
  version = "v0.*",
  lazy = false,
  opts = {
    keymap = { preset = "enter" },
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer" },
      },
    },
    trigger = {
      completion = {
        keyword_range = "full",
        blocked_trigger_characters = { " ", "\n", "\t", "(", ")", '"', "'", "{", "}", "[", "]", ",", "<", ">" },
      },
      signature_help = {
        enabled = true,
      },
    },
    fuzzy = {
      use_typo_resistance = false,
    },
  },
}
