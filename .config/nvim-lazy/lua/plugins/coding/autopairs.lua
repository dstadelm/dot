return {
	{
		"windwp/nvim-autopairs",
		enabled = require("config").is_enabled("autopairs"),
		config = true,
		lazy = true,
		event = "VeryLazy",
	},
}
