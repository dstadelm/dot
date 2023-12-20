vim.g.mapleader = ","
vim.g.maplocalleader = " "

require("options")
require("bootstrap")
require("lazy").setup({
	{ import = "plugins.coding" },
	{ import = "plugins.coding.dap" },
	{ import = "plugins.coding.lsp" },
	{ import = "plugins.notes" },
	{ import = "plugins.editor" },
	{ import = "plugins.editor.completion" },
	{ import = "plugins.editor.git" },
	{ import = "plugins.ui" },
	{ import = "plugins.colorschemes" },
})
require("keymaps")
require("abbreviations")
require("augroup")
require("utilities/formatting")
require("utilities/diagnostics")
require("functions/center_cursorline")
