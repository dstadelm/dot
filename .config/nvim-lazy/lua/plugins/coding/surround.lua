return {
	{
		"kylechui/nvim-surround",
		enabled = require("config").is_enabled("surround"),
		config = true,
		lazy = true,
		event = "VeryLazy",
	},
}
