return {
  'scalameta/nvim-metals',
  name = 'metals',
  ft = { 'scala', 'sbt', 'java' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'deathbeam/autocomplete.nvim',
  },
  config = function()
    local metals_config = require('metals').bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
    }
    metals_config.init_options.statusBarProvider = 'on'
    metals_config.capabilities = require('autocomplete.capabilities')

    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'scala', 'sbt', 'java' },
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
