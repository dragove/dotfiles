return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'garymjr/nvim-snippets',
      keys = {
        {
          '<Tab>',
          function()
            if vim.snippet.active({ direction = 1 }) then
              vim.schedule(function()
                vim.snippet.jump(1)
              end)
              return
            end
            return '<Tab>'
          end,
          expr = true,
          silent = true,
          mode = 'i',
        },
        {
          '<Tab>',
          function()
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          end,
          expr = true,
          silent = true,
          mode = 's',
        },
        {
          '<S-Tab>',
          function()
            if vim.snippet.active({ direction = -1 }) then
              vim.schedule(function()
                vim.snippet.jump(-1)
              end)
              return
            end
            return '<S-Tab>'
          end,
          expr = true,
          silent = true,
          mode = { 'i', 's' },
        },
      },
    },

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      completion = { completeopt = 'menu,menuone,noinsert' },

      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete({}),
      }),
      sources = {
        {
          name = 'lazydev',
          group_index = 0,
        },
        { name = 'snippets' },
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
    })
  end,
}
