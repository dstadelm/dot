return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	enabled = require("config").is_enabled("neogen"),
	lazy = true,
	event = "VeryLazy",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
