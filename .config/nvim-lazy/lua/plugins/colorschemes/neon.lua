local config = require("config")
return {
	"rafamadriz/neon",
	enabled = config.is_enabled("neon"),
	priority = config.get_colorscheme_priority("neon"),
	lazy = config.get_colorscheme_lazy("neon"),
	event = "VeryLazy",
	init = function()
		vim.g.neon_style = "default"
		vim.g.neon_transparent = false
	end,
	config = function()
		if config.is_default_colorscheme("neon") then
			vim.cmd.colorscheme("neon")
		end
	end,
}
