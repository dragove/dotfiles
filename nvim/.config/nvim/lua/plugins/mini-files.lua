return {
    "echasnovski/mini.files",
    version = false,
    config = function()
        vim.keymap.set("n", "<Leader>e", require("mini.files").open)
    end
}
