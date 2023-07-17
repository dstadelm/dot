local cmp = require("cmp")

cmp.setup.buffer({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

vim.cmd([[
set suffixesadd=.yaml
]])

vim.o.shiftwidth = 4
vim.o.tabstop = 4
