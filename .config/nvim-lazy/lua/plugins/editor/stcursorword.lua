return {
	"sontungexpt/stcursorword",
	enabled = require("config").is_enabled("stcursorword"),
	lazy = true,
	event = "VeryLazy",
	opts = {
		highlight = {
			underline = true,
			fg = nil,
			bg = nil,
		},
	},
	config = true,
}
