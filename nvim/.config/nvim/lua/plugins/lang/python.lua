return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').basedpyright.setup({})
  end,
}
