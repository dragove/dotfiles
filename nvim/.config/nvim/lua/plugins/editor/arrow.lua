return {
  "otavioschwanck/arrow.nvim",
  opts = function()
    -- disable keymap for default mark to prevent delay on m key
    vim.keymap.set({ "n", "v" }, "m", "<nop>")
    vim.keymap.set("n", "H", require("arrow.persist").previous)
    vim.keymap.set("n", "L", require("arrow.persist").next)
    return {
      show_icons = true,
      leader_key = ";",
      buffer_leader_key = "m",
    }
  end,
}
