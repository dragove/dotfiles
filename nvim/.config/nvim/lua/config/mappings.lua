local keymap = vim.keymap.set

local silent = { silent = true }

-- Paste before/after linewise
keymap({ "n", "x" }, "[p", '<Cmd>exe "put! " . v:register<CR>', { desc = "Paste Above" })
keymap({ "n", "x" }, "]p", '<Cmd>exe "put "  . v:register<CR>', { desc = "Paste Below" })

-- navigate buffers
keymap({ "n", "x" }, "H", "<Cmd>bp<CR>", { desc = "previous buffer" })
keymap({ "n", "x" }, "L", "<Cmd>bn<CR>", { desc = "next buffer" })

-- lsp
keymap("n", "gr", "<cmd>Telescope lsp_references include_declaration=false<cr>")
