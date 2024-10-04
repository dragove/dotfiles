return {
  'nvimdev/guard.nvim',
  keys = {
    { '<leader>cf', '<CMD>Guard fmt<CR>', { 'n', 'v' }, { desc = 'format code' } },
  },
  dependencies = {
    'nvimdev/guard-collection'
  },
  init = function()
    vim.g.guard_config = {
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    }
  end,
  config = function()
    local biome = {
      cmd = 'biome',
      args = { 'format', '--write' },
      fname = true,
      stdin = false,
    }
    local ft = require('guard.filetype')
    -- Assuming you have guard-collection
    ft('lua'):fmt('stylua')
    ft('scala'):fmt('lsp')
    ft('json'):fmt(biome)
    ft('javascript'):fmt(biome)
    ft('javascriptreact'):fmt(biome)
    ft('typescript'):fmt(biome)
    ft('typescriptreact'):fmt(biome)
    ft('python'):fmt('ruff'):lint('ruff')
  end,
}
