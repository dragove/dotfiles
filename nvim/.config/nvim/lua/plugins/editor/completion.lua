return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "MeanderingProgrammer/render-markdown.nvim",
  },
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
      enabled = false,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "markdown" },
      providers = {
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
  },
}
