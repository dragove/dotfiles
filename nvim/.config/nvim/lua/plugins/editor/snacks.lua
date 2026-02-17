return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
    vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
      pattern = "*",
      callback = function()
        vim.wo.winbar = ""
      end,
    })
    return {
      bigfile = { enabled = true },
      indent = { enabled = true, animate = { enabled = false }, chunk = { enabled = true } },
      input = { enabled = true },
      picker = {
        enabled = true,
        matcher = { fuzzy = false, ignorecase = false },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = true },
    }
  end,
  keys = {
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "notifications",
    },
    {
      "<C-`>",
      function()
        Snacks.terminal()
      end,
      mode = { "n", "t" },
      desc = "toggle terminal",
    },
  },
}
