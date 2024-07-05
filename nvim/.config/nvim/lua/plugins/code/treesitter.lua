return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "windwp/nvim-ts-autotag" },
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"clojure",
			"cmake",
			"cpp",
			"css",
			"dockerfile",
			"fish",
			"go",
			"gomod",
			"gosum",
			"groovy",
			"html",
			"java",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"kotlin",
			"latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"meson",
			"ninja",
			"python",
			"rust",
			"scala",
			"sql",
			"tsx",
			"typescript",
			"vue",
			"yaml",
			"zig",
		},
		autotag = {
			enable = true,
		},
		matchup = {
			enable = true,
		},
	},
	init = function()
		vim.cmd([[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
        ]])
	end,
}
