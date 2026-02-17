return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    debug = {
      enabled = false,
      show_scores = true,
    },
  },
  lazy = false,
  keys = {
    {
      "<leader>ff",
      function() require('fff').find_files() end,
      desc = 'Find files',
    },
    {
      "<leader>sg",
      function() require('fff').live_grep() end,
      desc = 'Search grep',
    },
    {
      "<leader>sf",
      function()
        require('fff').live_grep({
          grep = {
            modes = { 'fuzzy', 'plain' }
          }
        })
      end,
      desc = 'Search fuzzy grep',
    }
  }
}
