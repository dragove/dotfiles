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
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "build.mill",
  desc = "Make mill file to be recognized as scala file",
  callback = function()
    vim.bo.filetype = "scala"
  end,
})

-- auto fill background color on margins
local modified = false
autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
      io.write(string.format("\027]11;#%06x\027\\", normal.bg))
      modified = true
    end
  end,
})
autocmd("UILeave", {
  callback = function()
    if modified then
      io.write("\027]111\027\\")
    end
  end,
})
