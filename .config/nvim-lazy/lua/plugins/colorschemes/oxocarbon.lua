local config = require("config")
return {
	"B4mbus/oxocarbon-lua.nvim",
	enabled = config.is_enabled("oxocarbon"),
	priority = config.get_colorscheme_priority("oxocarbon"),
	lazy = config.get_colorscheme_lazy("oxocarbon"),
	event = "VeryLazy",
	config = function()
		vim.g.oxocarbon_lua_transparent = true
	end,
}
