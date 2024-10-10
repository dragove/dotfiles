return { -- Autocompletion
  'iguanacucumber/magazine.nvim',
  name = 'nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
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
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete({}),
      }),
      sources = {
        { name = 'snippets' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'lazydev', group_index = 0 },
      },
    })
  end,
}
