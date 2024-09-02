return {
  'otavioschwanck/arrow.nvim',
  opts = function()
    vim.keymap.set('n', 'H', require('arrow.persist').previous)
    vim.keymap.set('n', 'L', require('arrow.persist').next)
    return {
      show_icons = true,
      leader_key = ';',
      buffer_leader_key = 'm',
    }
  end,
}
