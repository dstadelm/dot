return {

	-- Ultisnips Interferes with tab keymap
	{
		"hrsh7th/nvim-cmp",
		enabled = require("config").is_enabled("nvim_cmp"),
		name = "nvim-cmp",
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{
				"SirVer/ultisnips",
				name = "ultisnips",
				init = function()
					vim.g.UltiSnipsExpandTrigger = "<C-k>"
					vim.g.UltiSnipsJumpForwardTrigger = "<C-k>"
					vim.g.UltiSnipsJumpBackwardTrigger = "<C-j>"
				end,
			},
			"honza/vim-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"lukas-reineke/cmp-under-comparator",
			"hrsh7th/cmp-cmdline",
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = true,
			},
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function(plugin, opts)
			local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

			vim.o.completeopt = "menu,menuone,noselect"
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			cmp.setup({
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol", -- text, text_symbol, symbol_text, symbol
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					}),
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				completion = {
					completeopt = "menu,menuone,noselect",
					keyword_length = 1,
					-- autocomplete = true,
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-k>"] = cmp.mapping(function(fallback)
						cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
					end, {
						"i",
						"s", --[[ "c" (to enable the mapping in command mode) ]]
					}),
					["<C-j>"] = cmp.mapping(function(fallback)
						cmp_ultisnips_mappings.jump_backwards(fallback)
					end, {
						"i",
						"s", --[[ "c" (to enable the mapping in command mode) ]]
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "ultisnips" }, -- For ultisnips users.
					{ name = "buffer" },
					{ name = "path" },
					{ name = "calc" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "neorg" },
				}),
			})

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			-- cmp.setup.cmdline(":", {
			-- 	-- completion = {
			-- 	-- 	autocomplete = false,
			-- 	-- },
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = cmp.config.sources({
			-- 		{ name = "path" },
			-- 		-- { name = "buffer" },
			-- 	}, {
			-- 		{ name = "cmdline" },
			-- 	}),
			-- })
			--

			-- `:` cmdline setup.
			-- Use cmp.cmdline only for '/' search completion because it does not play nice
			-- with:
			-- - $ENV_VARS
			-- - wildcard expansion (%:h:p, ...)
			-- - */** notation
			-- Skipping the setup entirely prevents cmdline completion from working after
			-- searching once (insertion of '^I' when pressing Tab).
			local function send_wildchar()
				local char = vim.fn.nr2char(vim.opt.wildchar:get())
				local key = vim.api.nvim_replace_termcodes(char, true, false, true)
				vim.api.nvim_feedkeys(key, "nt", true)
			end
			cmp.setup.cmdline(":", {
				mapping = {
					["<Tab>"] = { c = send_wildchar },
				},
				sources = cmp.config.sources({}),
			})
		end,
	},
}
