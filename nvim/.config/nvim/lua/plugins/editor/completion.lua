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
      implementation = "lua",
      max_typos = nil,
    },
    cmdline = {
      enabled = false,
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "markdown" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
  },
}
