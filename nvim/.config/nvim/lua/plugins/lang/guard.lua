return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local ft = require('guard.filetype')
    -- Assuming you have guard-collection
    ft('lua'):fmt('lsp'):append('stylua'):lint('selene')
    require('guard').setup({
      fmt_on_save = false,
      lsp_as_default_formatter = false,
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<CMD>GuardFmt<CR>', { desc = 'format code' })
  end,
}
