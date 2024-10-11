return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    vim.g.guard_config = {
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    }
    local ft = require('guard.filetype')
    -- Assuming you have guard-collection
    ft('lua'):fmt('stylua')
    ft('json'):fmt('biome')
    ft('javascript'):fmt('biome')
    ft('typescript'):fmt('biome')
    ft('javascriptreact'):fmt('biome')
    ft('typescriptreact'):fmt('biome')
    ft('python'):fmt('ruff'):lint('ruff')
  end,
}
