return {
	{
		"numToStr/Comment.nvim",
		enabled = require("config").is_enabled("comment"),
		lazy = true,
		config = true,
		keys = {
			{ "gcc" },
			{ "gc", mode = "v" },
			{ "gc", mode = "n" },
		},
	},
}
