return {
	{
		"Dan7h3x/signup.nvim",
		enabled = require("config").is_enabled("signup"),
		branch = "main",
		opts = {
			-- Your configuration options here
		},
		config = function(_, opts)
			require("signup").setup(opts)
		end,
	},
}
