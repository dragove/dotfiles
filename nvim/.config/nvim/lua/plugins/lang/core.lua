return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvimdev/lspsaga.nvim',
  },
  config = function()
    local lspsaga = require('lspsaga')
    lspsaga.setup({
      lightbulb = { enable = false },
    })
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>cr', '<CMD>Lspsaga rename<CR>', 'rename')
        map('<leader>ca', '<CMD>Lspsaga code_action<CR>', 'code action', { 'n', 'x' })
        map('gd', '<CMD>Lspsaga goto_definition<CR>', 'goto definition')
        map('gi', '<CMD>Lspsaga finder imp<CR>', 'goto implementation')
        map('[d', '<CMD>Lspsaga diagnostic_jump_prev<CR>', 'jump to previous diagnostics')
        map(']d', '<CMD>Lspsaga diagnostic_jump_next<CR>', 'jump to next diagnostics')
        map('K', '<CMD>Lspsaga hover_doc<CR>', 'show doc')
        map('<leader>o', '<CMD>Lspsaga outline<CR>', 'open outline')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
        then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
            end,
          })
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, 'Toggle Inlay Hints')
        end
      end,
    })
    require('lspconfig').lua_ls.setup({
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
    require('lspconfig').basedpyright.setup({})
    require('lspconfig').clangd.setup({})
  end,
}
