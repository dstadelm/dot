return {
	"akinsho/toggleterm.nvim",
	enabled = require("config").is_enabled("toggleterm"),
	config = true,
	lazy = true,
	cmd = "ToggleTerm",
	keys = {
		{ "<F10>" },
	},
}
