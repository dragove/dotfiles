local map = vim.keymap.set
local utils = require("config.utils")

-- disable space on n/v mode
map({ "n", "v" }, "<space>", "<nop>")

-- keymaps for save and leave buffer
map({ "n" }, "S", "<CMD>confirm w<CR>")
map({ "n" }, "Q", utils.close_buf)
map({ "n" }, "<leader>bd", "<CMD>confirm bd<CR>")

-- jump window
map({ "n", "i", "t" }, "<A-o>", function()
  vim.cmd.wincmd("w")
end, { desc = "jump to another window" })

-- emacs like keymap on insert and terminal mode
map({ "i", "t" }, "<C-f>", "<Right>")
map({ "i", "t" }, "<C-b>", "<Left>")
map({ "i", "t" }, "<C-a>", "<Home>")
map({ "i", "t" }, "<C-e>", "<End>")
map({ "i", "t" }, "<C-p>", "<Up>")
map({ "i", "t" }, "<C-n>", "<Down>")
map({ "i", "t" }, "<C-v>", "<PageDown>")
map({ "i", "t" }, "<M-v>", "<PageUp>")

-- cancel highlight
map({ "n" }, "<leader>nh", "<CMD>noh<CR>", { desc = "remove highlightings" })

-- some mapping for clipboard
map({ "n" }, "<leader>yy", '"+yy', { desc = "yank to system clipboard" })
map({ "v" }, "<leader>y", '"+y', { desc = "yank to system clipboard" })
map({ "n" }, "<leader>p", '"+p', { desc = "pate from system clipboard" })
