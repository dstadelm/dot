return {
	{
		"sindrets/diffview.nvim",
		enabled = require("config").is_enabled("diffview"),
		lazy = true,
		event = "VeryLazy",
	},
}
