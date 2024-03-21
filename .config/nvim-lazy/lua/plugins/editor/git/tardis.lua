return {
	"fredeeb/tardis.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = require("config").is_enabled("tardis"),
	lazy = true,
	cmd = { "Tardis" },
	config = true,
}
