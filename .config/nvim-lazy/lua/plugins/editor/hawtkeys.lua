return {
	"tris203/hawtkeys.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	enabled = require("config").is_enabled("hawtkeys"),
	lazy = true,
	event = "VeryLazy",
	config = {},
}
