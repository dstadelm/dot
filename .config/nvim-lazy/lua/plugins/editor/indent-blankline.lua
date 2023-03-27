return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = require("config").is_enabled("indent_blankline"),
	lazy = true,
	event = "VeryLazy",
	config = function()
		vim.cmd([[
                let g:indent_blankline_filetype = ['py',  'yaml']
                let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
              ]])
	end,
}
