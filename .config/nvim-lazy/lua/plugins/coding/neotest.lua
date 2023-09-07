local is_enabled = require("config").is_enabled
return {
	-- testing
	{
		"nvim-neotest/neotest",
		enabled = is_enabled("neotest") and is_enabled("treesitter"),
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				icons = {
					child_indent = "│",
					child_prefix = "├",
					collapsed = "─",
					expanded = "╮",
					failed = "✖",
					final_child_indent = " ",
					final_child_prefix = "╰",
					non_collapsible = "─",
					passed = "✔",
					running = "🗘",
					running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
					skipped = "ﰸ",
					unknown = "?",
				},
				adapters = {
					require("neotest-python")({}),
				},
			})
		end,
		keys = {
			--------------------------------------------------------------------------------
			-- Neotest
			--
			{
				"<leader>ta",
				":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				desc = "Run all tests in file",
			},
			{ "<leader>tn", ":lua require('neotest').run.run()<CR>", desc = "Run nearest tests in file" },
			{ "<leader>tl", ":lua require('neotest').run.run_last()<CR>", desc = "Run last test again" },
			{
				"<leader>td",
				":lua require('neotest').run.run({strategy = 'dap'})<CR>",
				desc = "Run nearest tests in file",
			},
			{ "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
			{ "<leader>to", ":lua require('neotest').output.open({enter=true})<CR>", desc = "Inspect output" },

			{ "]n", ':lua require("neotest").jump.next({ status = "failed" })<CR>', desc = "Jump to next failed test" },
			{
				"[n",
				':lua require("neotest").jump.prev({ status = "failed" })<CR>',
				desc = "Jump to previous failed test",
			},
		},
	},
}
