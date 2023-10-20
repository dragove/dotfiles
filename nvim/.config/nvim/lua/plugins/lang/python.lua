return {
	"neovim/nvim-lspconfig",
	opts = {
		opts = {
			servers = {
				pylsp = {},
			},
		},
		setup = {
			pyright = function()
				return true
			end,
		},
	},
}
