return {
	"rcarriga/nvim-notify",
	enabled = require("config").is_enabled("notify"),
	-- lazy = true,
	-- event = "VeryLazy",
	opts = {
		top_down = true,
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}
