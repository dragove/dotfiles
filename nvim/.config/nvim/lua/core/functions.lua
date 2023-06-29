function open_float()

  vim.api.nvim_open_win(buffer, true, {
      relative='win',
      width=120,
      height=10,
      border="single",
      win = 1001,
      row = 20,
      col = 20,
      zindex=1
  })

end
