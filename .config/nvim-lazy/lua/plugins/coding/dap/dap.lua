return {
	{
		"mfussenegger/nvim-dap",
		name = "nvim-dap",
		enabled = require("config").is_enabled("nvim_dap"),
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
				config = function()
					require("dapui").setup()
					-- nnoremap("<leader>duo", ':lua require("dapui").open()<CR>', { silent = false })
					-- nnoremap("<leader>duc", ':lua require("dapui").close()<CR>', { silent = false })
					-- nnoremap("<leader>dut", ':lua require("dapui").toggle()<CR>', { silent = false })
					-- nnoremap("<leader>de", ':lua require("dapui").eval()<CR>', { silent = false })
				end,
			},
			{
				"williamboman/mason.nvim",
				enabled = require("config").is_enabled("mason"),
				dependencies = {
					"jay-babu/mason-nvim-dap.nvim",
				},
			},
		},
		config = function()
			require("dap")
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "🔶", texthl = "", linehl = "", numhl = "" })
		end,

		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dcb",
				function()
					local cond = vim.fn.input("condition: ")
					require("dap").set_breakpoint(cond)
				end,
				desc = "Continue",
			},
			{
				"<leader>dcc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>df",
				function()
					require("dap.ui.widgets").preview()
				end,
				desc = "Preview",
			},
			{
				"<leader>dh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Show item under cursor",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>ds",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>du",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to C[u]rsor",
			},
			{
				"<leader>duc",
				function()
					require("dapui").close()
				end,
				desc = "Dap Ui Close",
			},
			{
				"<leader>due",
				function()
					require("dapui").eval()
				end,
				desc = "Dap Ui Eval",
			},
			{
				"<leader>duo",
				function()
					require("dapui").open()
				end,
				desc = "Dap Ui Open",
			},
			{
				"<leader>dut",
				function()
					require("dapui").toggle()
				end,
				desc = "Dap Ui Toggle",
			},
		},
	},
}
