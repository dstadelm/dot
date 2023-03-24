local M = {}
M.autoformat = true

local function format(_)
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name ~= "lua_ls" and client.name ~= "pyright" and client.name ~= "pylsp"
		end,
		bufnr = bufnr,
	})
end

local function auto_format()
	if M.autoformat then
		format()
	end
end

local function toggle_autoformat()
	M.autoformat = not M.autoformat
end

local function toggle_diagnostics()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.diagnostic.is_disabled() then
		vim.diagnostic.enable(bufnr)
	else
		vim.diagnostic.disable(bufnr)
	end
end

local function create_user_commands(bufnr)
	vim.api.nvim_buf_create_user_command(bufnr, "ToggleAutoformat", toggle_autoformat, { desc = "Toggle Autoformat" })
	vim.api.nvim_buf_create_user_command(bufnr, "Format", format, { desc = "Format current buffer with LSP" })
	vim.api.nvim_buf_create_user_command(
		bufnr,
		"ToggleDiagnostics",
		toggle_diagnostics,
		{ desc = "Toggle Diagnostics" }
	)
end

local function create_autocmd(client, bufnr)
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {}) -- do not clear as for each buffer / client we add a autocmd
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				auto_format()
			end,
		})
	end
end

local function define_signs()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function lsp_keymaps(bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	nmap("<space>e", vim.diagnostic.open_float, "Open diacnostic float")
	nmap("[d", vim.diagnostic.goto_prev, "Diagnostic go to previous")
	nmap("]d", vim.diagnostic.goto_next, "Diagnostic go to next")
	nmap("<space>q", vim.diagnostic.setqflist, "Diagnostic set [q]uickfix list")
	nmap("<leader>gf", vim.diagnostic.setloclist, "Diagnostic set location list")

	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
	nmap("<space>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")
	nmap("<space>D", vim.lsp.buf.type_definition, "Type [Definition]")
	nmap("<space>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<space>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")

	nmap("<leader>D", toggle_diagnostics, "Toggle [D]iagnostics")
	nmap("<leader>F", toggle_autoformat, "Toggle auto [F]ormating")
end

local function on_attach(client, bufnr)
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	lsp_keymaps(bufnr)
	create_user_commands(bufnr)
	create_autocmd(client, bufnr)

	-- Enable completion triggered by <c-x><c-o>
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local function capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	if package.loaded["cmp_nvim_lsp"] then
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	end
	return capabilities
end

local function setup_rust_hdl()
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")

	if not configs.rust_hdl then
		configs.rust_hdl = {
			default_config = {
				cmd = { "/home/dstadelmann/rust/rust_hdl/target/release/vhdl_ls" },
				filetypes = { "vhdl" },
				root_dir = function(fname)
					return lspconfig.util.find_git_ancestor(fname)
					------------------------------------------------------------
					-- alternatively one could define the toml file as root
					-- return lspconfig.util.root_pattern('vhdl_ls.toml')(fname)
				end,
				autostart = true,
				settings = {},
				flags = {
					allow_incremental_sync = true,
					debounce_text_changes = 5000,
				},
			},
		}
	end

	lspconfig.rust_hdl.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

function M.setup()
	define_signs()

	if not package.loaded["noice"] then
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
		})
	end

	setup_rust_hdl()
	-- Enable diagnostics
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		virtual_text = true,
		virtual_lines = false,
		signs = true,
		update_in_insert = false,
	})

	local servers = {
		vimls = {},
		clangd = {},
		lemminx = {},
		texlab = {},
		-- ruff_ls = {},
		lua_ls = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
		yamlls = {
			yaml = {
				schemas = {
					["/home/dstadelmann/regenor-yaml/newer.schema.json"] = "/home/dstadelmann/regenor-yaml/*",
				},
				customTags = { "!include" },
			},
		},
		pyright = {
			pyright = {
				disableOrganizeImports = true,
				openFilesOnly = true,
			},
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "openFilesOnly",
				},
			},
		},
	}

	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capablities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
			})
		end,
	})

	-- local util = require 'lspconfig.util'
	-- require'lspconfig'.pylsp.setup{
	--   on_attach = on_attach,
	--   capabilities = capabilities,
	--   root_dir = function(fname)
	--     local root_files = {
	--       'pyproject.toml',
	--       'setup.py',
	--       'setup.cfg',
	--       'requirements.txt',
	--       'Pipfile',
	--     }
	--     return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
	--   end,
	--   single_file_support = true,
	--   settings = {
	--     pylsp = {
	--       plugins = {
	--         -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
	--         pycodestyle = {enabled = false},
	--         pydocstyle = {enabled = false},
	--         autopep8 = {enabled = false},
	--         flake8 = {enabled = false},
	--         pyflakes = {enabled = false},
	--         yapf = {enaboed = false},
	--         pylint = {
	--           enabled = true,
	--           args = {'--rcfile', 'pyproject.toml' },
	--         },
	--         isort = {enabled = false},
	--         pyls_mypy = {enabled = false},
	--       }
	--     }
	--   }
	-- }
end

return M
