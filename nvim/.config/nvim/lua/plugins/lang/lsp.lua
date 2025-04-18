return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/snacks.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    vim.diagnostic.config({ virtual_text = true })
    -- code copied from https://www.reddit.com/r/neovim/comments/1jm5atz/comment/mk9w6v0/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
    local function jumpWithVirtLineDiags(jumpCount)
      pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags")
      vim.diagnostic.jump({ count = jumpCount })
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { current_line = true },
      })
      vim.defer_fn(function()
        vim.api.nvim_create_autocmd("CursorMoved", {
          desc = "User(once): Reset diagnostics virtual lines",
          once = true,
          group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
          callback = function()
            vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
          end,
        })
      end, 1)
    end
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local buf = event.buf
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = buf, desc = "LSP: " .. desc })
        end

        map("<leader>cr", vim.lsp.buf.rename, "rename")
        map("<leader>ca", vim.lsp.buf.code_action, "code action", { "n", "x" })
        map("<leader>cl", vim.lsp.codelens.run, "run code lens")
        map("gd", function()
          Snacks.picker.lsp_definitions()
        end, "Goto Definition")
        map("gD", function()
          Snacks.picker.lsp_declarations()
        end, "Goto Definition")
        map("gi", function()
          Snacks.picker.lsp_implementations()
        end, "goto implementation")
        map("<leader>o", function()
          Snacks.picker.lsp_symbols()
        end, "open outline")
        map("]d", function()
          jumpWithVirtLineDiags(1)
        end, "Next diagnostic")
        map("[d", function()
          jumpWithVirtLineDiags(-1)
        end, "Prev diagnostic")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client == nil then
          return
        end
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          -- default to enable inlay hint
          vim.lsp.inlay_hint.enable(true, { bufnr = buf })
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
          end, "Toggle Inlay Hints")
        end

        if client:supports_method("textDocument/foldingRange") then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        if client.server_capabilities.codeLensProvider then
          vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            buffer = buf,
            callback = vim.lsp.codelens.refresh,
          })
        end
      end,
    })
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("clangd")
  end,
}
