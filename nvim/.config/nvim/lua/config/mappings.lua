-- Helper function
local default_opts = {
	noremap = true,
	silent = true,
	expr = false,
	nowait = false,
	script = false,
	unique = false,
}

local keymap = function(mode, keys, cmd, opts)
	local o = vim.tbl_deep_extend("force", default_opts, opts or {})
	vim.keymap.set(mode, keys, cmd, o)
end

-- NOTE: Most mappings come from 'mini.basics'

-- Shorter version of the most frequent way of going outside of terminal window
keymap("t", [[<C-h>]], [[<C-\><C-N><C-w>h]])

-- Paste before/after linewise
vim.keymap.set({ "n", "x" }, "[p", '<Cmd>exe "put! " . v:register<CR>', { desc = "Paste Above" })
vim.keymap.set({ "n", "x" }, "]p", '<Cmd>exe "put "  . v:register<CR>', { desc = "Paste Below" })

-- navigate buffers
vim.keymap.set({ "n", "x" }, "H", "<Cmd>bp<CR>", { desc = "previous buffer" })
vim.keymap.set({ "n", "x" }, "L", "<Cmd>bn<CR>", { desc = "next buffer" })
