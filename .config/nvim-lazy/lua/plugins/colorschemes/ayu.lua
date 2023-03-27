local config = require("config")
return {
	"Shatur/neovim-ayu",
	enabled = config.is_enabled("ayu"),
	priority = config.get_colorscheme_priority("ayu"),
	lazy = config.get_colorscheme_lazy("ayu"),
	event = "VeryLazy",
}
