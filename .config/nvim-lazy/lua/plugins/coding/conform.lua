return {
	{
		"stevearc/conform.nvim",
		enabled = require("config").is_enabled("conform"),

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				yaml = { "yamlfmt" },
			},
		},
	},
}
