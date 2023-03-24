return {
	{
		"neovim/nvim-lspconfig",
		enabled = require("config").is_enabled("lspconfig"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"folke/neoconf.nvim",
				enabled = require("config").is_enabled("neoconf"),
				cmd = "Neoconf",
				config = true,
			},
			{
				"folke/neodev.nvim",
				enabled = require("config").is_enabled("neodev"),
				opts = { experimental = { pathStrict = true } },
			},
			"mason",
		},
		config = function()
			require("functions.lsp.setup").setup()
		end,
	},
}
