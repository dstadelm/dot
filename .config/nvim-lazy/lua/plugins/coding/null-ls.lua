return {
	"jose-elias-alvarez/null-ls.nvim",
	enabled = require("config").is_enabled("null_ls"),
	-- lazy = true,
	-- event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		-- register any number of sources simultaneously
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions
		local formatting = null_ls.builtins.formatting
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		--

		-- vhdl-style-guide
		local helpers = require("null-ls.helpers")
		local vsg_lint = {
			name = "VSG Linting",
			method = null_ls.methods.DIAGNOSTICS,
			filetypes = { "vhdl" },
			generator = helpers.generator_factory({
				command = "vsg",
				args = function(params)
					local rv = {}
					-- check if there is a config file in the root directory, if so
					-- insert the -c argument with it
					if vim.fn.filereadable(params.root .. "/vsg_config.yaml") == 1 then
						table.insert(rv, "-c=" .. params.root .. "/vsg_config.yaml")
					end
					table.insert(rv, "--stdin")
					table.insert(rv, "-of=syntastic")
					return rv
				end,
				cwd = nil,
				-- check_exit_code = { 0, 1 },
				check_exit_code = function(code, stderr)
					local success = code <= 1
					if not success then
						vim.notify(stderr)
					end
					return success
				end,
				from_stderr = false,
				ignore_stderr = true,
				to_stdin = true,
				format = "line",
				multiple_files = false,
				on_output = helpers.diagnostics.from_patterns({
					{
						pattern = [[(%w+).*%((%d+)%)(.*)%s+%-%-%s+(.*)]],
						groups = { "severity", "row", "code", "message" },
						overrides = {
							severities = {
								-- 2 is for warnings, nvim showing as an erorr can be obnoxious. Change if desired
								["ERROR"] = 2,
								["WARNING"] = 3,
								["INFORMATION"] = 3,
								["HINT"] = 4,
							},
						},
					},
				}),
			}),
		}

		local vsg_format = {
			name = "VSG Formatting",
			method = null_ls.methods.FORMATTING,
			filetypes = { "vhdl" },
			generator = helpers.formatter_factory({
				command = "vsg",
				args = { "-c$ROOT/vsg_config.yaml", "-f=$FILENAME", "-of=syntastic", "--fix" },
				cwd = nil,
				check_exit_code = { 0, 1 },
				ignore_stderr = true,
				to_temp_file = true,
				from_temp_file = true,
				to_stdin = false,
				multiple_files = false,
			}),
		}

		local sources = {
			code_actions.shellcheck,
			diagnostics.shellcheck,
			diagnostics.checkmake,
			diagnostics.chktex,
			diagnostics.gitlint,
			formatting.latexindent,
			formatting.isort,
			formatting.black, -- .with({ extra_args = {"--line-length", "120"}}),
			formatting.stylua,
			formatting.yamlfmt,
			vsg_lint,
			vsg_format,
		}

		null_ls.setup({
			-- diagnostics_format = "[#{c}] #{m} (#{s})",
			sources = sources,
		})
	end,
}
