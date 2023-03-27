return {
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		enabled = require("config").is_enabled("alpha"),
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
