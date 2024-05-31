local map = vim.keymap.set

-- jump window
map({ "n", "i", "t" }, "<A-o>", function()
	vim.cmd.wincmd("w")
end, { desc = "jump to another window" })

-- lsp
map("n", "gr", "<cmd>Telescope lsp_references include_declaration=false<cr>")
