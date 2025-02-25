return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = { preset = "enter" },
    appearance = { use_nvim_cmp_as_default = false },
    completion = {
      keyword = { range = "full" },
      accept = { auto_brackets = { enabled = false } },
    },
    signature = {
      enabled = true,
    },
    fuzzy = {
      max_typos = nil,
    },
    cmdline = {
      enabled = false
    },
  },
}
