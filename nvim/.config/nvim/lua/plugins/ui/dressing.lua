return {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
        input = {
            win_options = {
                winblend = 0
            }
        },
        select = {
            nui = {
                win_options = {
                    winblend = 0
                }
            }
        }
    },
    init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
        end
    end,
}
