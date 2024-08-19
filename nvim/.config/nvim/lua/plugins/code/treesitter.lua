return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'cpp',
        'java',
        'scala',
        'kotlin',
        'groovy',
        'python',
        'javascript',
        'typescript',
      },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    })
  end,
}
