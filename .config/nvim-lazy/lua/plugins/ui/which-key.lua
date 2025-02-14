return {
	"folke/which-key.nvim",
	enabled = require("config").is_enabled("which_key"),
	lazy = true,
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		_G.dstadelm = {
			mappings = {},
		}
		wk.setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		wk.add({
			{ "<leader>c", group = "change" },
			{ "<leader>c", group = "change", mode = "x" },
			{ "<leader>d", group = "delete" },
			{ "<leader>d", group = "delete", mode = "x" },
			--------------------------------------------------------------------------------
			-- Telescope <find>
			{ "<leader>f", group = "find" },
			--------------------------------------------------------------------------------
			-- refactoring
			{
				mode = { "v" },
				{ "<leader>r", group = "refactoring" },
				{
					"<leader>re",
					"<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
					desc = "extract function",
				},
				{
					"<leader>rf",
					" <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
					desc = "extract function to file",
				},
				{
					"<leader>ri",
					" <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
					desc = "inline variable",
				},
				{
					"<leader>rr",
					" <Esc><Cmd>lua require('refactoring').select_refactor()<CR> ",
					desc = "select refactoring",
				},
				{
					"<leader>rv",
					" <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
					desc = "extract variable",
				},
			},
			{ "<leader>r", group = "refactoring" },
			{
				"<leader>rb",
				" <Esc><Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
				desc = "extract block",
			},
			{
				"<leader>rf",
				" <Esc><Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
				desc = "extract function to file",
			},
			{
				"<leader>ri",
				" <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
				desc = "inline variable",
			},
		})

		--------------------------------------------------------------------------------
		-- VHDL Buffer local mappings
		local augroup_vhdl_buflocal_keymaps = vim.api.nvim_create_augroup("vhdl_buflocal_keymaps", { clear = true })

		local vhdl_buflocal_keymaps = function()
			wk.add({
				{ "<leader>v", group = "VHDL" },
				{ "<leader>vi", "<cmd>VhdlInsertInstanceFromTag<cr>", desc = "Insert an instance from tags" },
				{ "<leader>vc", "<cmd>VhdlUpdateCtags<cr>", desc = "Update vhdl ctags" },
				{ "<leader>vp", "<cmd>VhdlPasteSignals<cr>", desc = "Paste signals from copied instance" },
				{ "<leader>vs", "<cmd>VhdlUpdateSensitivityList<cr><cr>", desc = "Update sensitivity list" },
				{ "<leader>vb", "<cmd>VhdlBeautify<cr><cr>", desc = "Format buffer" },
			})
		end

		vim.api.nvim_create_autocmd(
			{ "BufNew", "BufRead" },
			{ pattern = "*.vhd", group = augroup_vhdl_buflocal_keymaps, callback = vhdl_buflocal_keymaps }
		)
	end,
}
