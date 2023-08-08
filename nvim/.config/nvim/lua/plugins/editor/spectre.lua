return {
    "nvim-pack/nvim-spectre",
    keys = { { "<leader>sr", function() require("spectre").toggle() end, "toggle spectre" } },
    opts = {},
}
