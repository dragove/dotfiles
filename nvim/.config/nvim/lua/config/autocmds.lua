local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd({ 'TextChanged', 'InsertLeave' }, {
  desc = 'Autosave on some actions',
  command = 'silent! wall',
  nested = true,
})
autocmd('BufRead', {
  desc = 'Diable Editing Readonly files',
  callback = function()
    vim.bo.modifiable = not vim.bo.readonly
  end,
})
