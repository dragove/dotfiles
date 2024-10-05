return {
  'yioneko/nvim-vtsls',
  ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  config = function()
    require('lspconfig.configs').vtsls = require('vtsls').lspconfig
    require('lspconfig').vtsls.setup({})
  end,
  dependencies = { 'neovim/nvim-lspconfig' },
}
