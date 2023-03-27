return {
	{
		"tpope/vim-projectionist",
		enabled = require("config").is_enabled("projectionist"),
		lazy = true,
		event = "VeryLazy",
	},
}
