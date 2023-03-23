return {
	{
		"mizlan/iswap.nvim",
		enabled = require("config").is_enabled("iswap"),
		lazy = true,
		cmd = "ISwap",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
