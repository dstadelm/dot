return {
	{
		"mbbill/undotree",
		enabled = require("config").is_enabled("undotree"),
		lazy = true,
		event = "VeryLazy",
	},
}
