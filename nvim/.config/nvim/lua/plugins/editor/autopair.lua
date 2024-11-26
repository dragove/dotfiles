return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    local cond = require("nvim-autopairs.conds")
    autopairs.setup({
      disable_in_visualblock = true,
    })
    -- disable single quote for some languages for symbols
    autopairs.get_rules("'")[1]:with_pair(cond.not_filetypes({ "scheme", "lisp", "ocaml", "ml" }))
  end,
}
