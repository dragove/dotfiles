-- some code are copied from https://github.com/mrjones2014/dotfiles/blob/master/nvim/lua/my/configure/mini_files.lua
return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    {
      '<leader>e',
      function()
        local minifiles = require('mini.files')
        if vim.bo.ft == 'minifiles' then
          minifiles.close()
        else
          local file = vim.api.nvim_buf_get_name(0)
          local file_exists = vim.fn.filereadable(file) ~= 0
          minifiles.open(file_exists and file or nil)
          minifiles.reveal_cwd()
        end
      end,
      { desc = 'Open current directory' },
    },
    { '<leader>we', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Open working directory' } },
  },
  opts = {
    content = {
      filter = function(entry)
        return entry.name ~= '.git'
      end,
    },
    windows = {
      preview = true,
      width_preview = 120,
    },
  },
}
