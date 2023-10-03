return {
	"hrsh7th/nvim-cmp",
	init = function()
		local catppuccin = require("catppuccin.palettes").get_palette("frappe")
		if catppuccin then
			vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = catppuccin.base })
		end
	end,
}
