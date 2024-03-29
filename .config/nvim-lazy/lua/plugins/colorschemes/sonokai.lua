local config = require("config")
return {
	"sainnhe/sonokai",
	enabled = require("config").is_enabled("sonokai"),
	priority = config.get_colorscheme_priority("sonokai"),
	lazy = config.get_colorscheme_lazy("sonokai"),
	event = "VeryLazy",
	init = function()
		vim.g.sonokai_transparent_background = 1
	end,
	config = function()
		if config.is_default_colorscheme("sonokai") then
			vim.cmd.colorscheme("sonokai")
		end
	end,
}
