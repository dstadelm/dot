return {
	"nvimdev/hlsearch.nvim",
	enabled = require("config").is_enabled("hlsearch"),
	lazy = true,
	event = "BufRead",
	config = true,
}
