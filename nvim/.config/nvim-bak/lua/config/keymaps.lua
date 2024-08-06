local map = vim.keymap.set

-- jump window
map({ "n", "i", "t" }, "<A-o>", function()
	vim.cmd.wincmd("w")
end, { desc = "jump to another window" })

map({ "i" }, "<C-f>", "<Right>")
map({ "i" }, "<C-b>", "<Left>")
map({ "i" }, "<C-a>", "<Home>")
map({ "i" }, "<C-e>", "<End>")
map({ "i" }, "<C-v>", "<PageDown>")
map({ "i" }, "<M-v>", "<PageUp>")

-- lsp
map("n", "gr", "<cmd>Telescope lsp_references include_declaration=false<cr>")
