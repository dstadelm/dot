return {
	"m4xshen/smartcolumn.nvim",
	enabled = require("config").is_enabled("smartcolumn"),
	lazy = true,
	event = "BufRead",
	opts = {
		custom_colorcolumn = { python = { 120 } },
	},
}
