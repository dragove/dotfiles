local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

M = {}

local function buf_count()
  local bufnrs = vim.tbl_filter(function(b)
    if 1 ~= fn.buflisted(b) then
      return false
    else
      return true
    end
  end, api.nvim_list_bufs())
  return #bufnrs
end

function M.close_buf()
  -- is last buffer and the buffer is empty
  if buf_count() == 1 and api.nvim_buf_get_name(0) == '' then
    cmd('confirm q')
  else
    cmd('confirm bdelete')
  end
end

return M
