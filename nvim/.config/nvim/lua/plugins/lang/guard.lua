return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local biome = {
      cmd = 'pnpm',
      args = { 'biome', 'format', '--write' },
      fname = true,
      stdin = false,
    }
    local ft = require('guard.filetype')
    -- Assuming you have guard-collection
    ft('lua'):fmt('lsp'):append('stylua')
    ft('json'):fmt(biome)
    ft('javascript'):fmt(biome)
    ft('javascriptreact'):fmt(biome)
    ft('typescript'):fmt(biome)
    ft('typescriptreact'):fmt(biome)
    require('guard').setup({
      fmt_on_save = false,
      lsp_as_default_formatter = false,
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<CMD>GuardFmt<CR>', { desc = 'format code' })
  end,
}
