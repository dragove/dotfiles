local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd({ "InsertLeave", "FocusLost", "BufLeave" }, {
  desc = "Autosave on some actions",
  command = "silent! wall",
  nested = true,
})
autocmd("BufRead", {
  desc = "Diable Editing Readonly files",
  callback = function()
    vim.bo.modifiable = not vim.bo.readonly
  end,
})
local max_filesize = 1024 * 1024 -- 1 MB
local function big_file(buf)
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end
vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path, buf)
        return path and big_file(buf) and "bigfile" or nil
      end,
    },
  },
})
