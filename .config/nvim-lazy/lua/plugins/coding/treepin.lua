return {
	{
		"KaitlynEthylia/TreePin",
		enabled = require("config").is_enabled("treepin"),
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		lazy = true,
		event = "VeryLazy",
	},
}
