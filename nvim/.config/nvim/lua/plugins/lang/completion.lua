return {
  'deathbeam/autocomplete.nvim',
  config = function()
    vim.keymap.set('i', '<cr>', function()
      return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<cr>'
    end, { expr = true, replace_keycodes = true })
    require('autocomplete.signature').setup({
      border = nil,
      width = 80,
      height = 25,
      debounce_delay = 100,
    })

    require('autocomplete.buffer').setup({
      entry_mapper = nil,
      debounce_delay = 100,
    })
  end,
}
