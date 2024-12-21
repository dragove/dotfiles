return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = { preset = "enter" },
    appearance = { use_nvim_cmp_as_default = false },
    completion = {
      keyword = { range = "full" },
    },
    signature = {
      enabled = true,
    },
    fuzzy = {
      use_typo_resistance = false,
    },
    sources = {
      cmdline = {},
    },
  },
}
