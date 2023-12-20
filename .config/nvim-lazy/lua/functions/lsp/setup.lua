local M = {}
M.autoformat = true

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
end

local function on_attach(client, bufnr)
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	lsp_keymaps(bufnr)

	-- Enable completion triggered by <c-x><c-o>
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.buf.inlay_hint(bufnr, true)
	end
end

local function capabilities()
	local _capabilities = vim.lsp.protocol.make_client_capabilities()
	if package.loaded["cmp_nvim_lsp"] then
		_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	end
	return _capabilities
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
		capabilities = capabilities(),
	})
end

function M.setup()
	if not package.loaded["noice"] then
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
		})
	end

	-- Enable diagnostics
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		virtual_text = true,
		virtual_lines = false,
		signs = true,
		update_in_insert = false,
	})

	require("lspconfig")["pyright"].setup({
		capablities = capabilities(),
		on_attach = on_attach,
		settings = {
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
		},
	})

	local servers = {
		ruff_lsp = {},
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
					checkThirdParty = false,
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
					["/home/dstadelmann/regenor-yaml/all.json"] = "/home/dstadelmann/regenor-yaml/*",
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
				capablities = capabilities(),
				on_attach = on_attach,
				settings = servers[server_name],
			})
		end,
	})

	setup_rust_hdl()

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
	--         yapf = {enabled = false},
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
