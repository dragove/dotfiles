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
  local o = vim.tbl_deep_extend('force', default_opts, opts or {})
  vim.keymap.set(mode, keys, cmd, o)
end

-- NOTE: Most mappings come from 'mini.basics'

-- Disable `s` shortcut (use `cl` instead) for safer usage of 'mini.surround'
keymap('n', [[s]], [[<Nop>]])
keymap('x', [[s]], [[<Nop>]])

-- Shorter version of the most frequent way of going outside of terminal window
keymap('t', [[<C-h>]], [[<C-\><C-N><C-w>h]])

-- Stop highlighting of search results. NOTE: this can be done with default
-- `<C-l>` but this solution deliberately uses `:` instead of `<Cmd>` to go
-- into Command mode and back which updates 'mini.map'.
keymap('n', [[\h]], ':let v:hlsearch = 1 - v:hlsearch<CR>')

-- Paste before/after linewise
vim.keymap.set({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
vim.keymap.set({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>', { desc = 'Paste Below' })

-- C-tab to alternate buffers
vim.keymap.set({ 'n', 'x' }, '<C-TAB>', '<Cmd>b#<CR>', { desc = 'alternate tab' })

