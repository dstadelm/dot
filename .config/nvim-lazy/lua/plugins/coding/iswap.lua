local is_enabled = require("config").is_enabled
return {
	{
		"mizlan/iswap.nvim",
		enabled = is_enabled("iswap") and is_enabled("treesitter"),
		lazy = true,
		cmd = "ISwap",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
