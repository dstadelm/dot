local is_enabled = require("config").is_enabled
return {
	"Wansmer/treesj",
	enabled = is_enabled("treesj") and is_enabled("treesitter"),
	keys = {
		{
			"<space>m",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			{ desc = "Toggle split join list" },
		},
		{ "<space>j", ":TSJJoin", { desc = "Toggle join list" } },
		{ "<space>s", ":TSJSplit", { desc = "Toggle split list" } },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({
			-- Use default keymaps
			-- (<space>m - toggle, <space>j - join, <space>s - split)
			use_default_keymaps = true,

			-- Node with syntax error will not be formatted
			check_syntax_error = true,

			-- If line after join will be longer than max value,
			-- node will not be formatted
			max_join_length = 300,

			-- hold|start|end:
			-- hold - cursor follows the node/place on which it was called
			-- start - cursor jumps to the first symbol of the node being formatted
			-- end - cursor jumps to the last symbol of the node being formatted
			cursor_behavior = "hold",

			-- Notify about possible problems or not
			langs = {},
			notify = true,

			-- Use `dot` for repeat action
			dot_repeat = true,
		})
	end,
}
