return {
	"rcarriga/nvim-notify",
	enabled = require("config").is_enabled("notify"),
	-- lazy = true,
	-- event = "VeryLazy",
	opts = {
		background_colour = "#1e2127",
	},
	config = function()
    require('notify').setup({})
    vim.notify = require('notify')
  end
}
