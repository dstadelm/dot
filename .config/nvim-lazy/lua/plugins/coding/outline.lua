local is_enabled = require("config").is_enabled
return {
	"hedyhli/outline.nvim",
	enabled = is_enabled("outline"),
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			-- Your setup opts here (leave empty to use defaults)
			outline_window = {
				position = "left",
			},
		})
	end,
}
