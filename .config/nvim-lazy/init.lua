vim.g.mapleader = ","
vim.g.maplocalleader = " "

require("options")
require("bootstrap")
require("lazy").setup({
  { import = "plugins.coding" },
  { import = "plugins.editor" },
  { import = "plugins.editor.git" },
  { import = "plugins.ui" },
  { import = "plugins.colorschemes" },
})
require("keymaps")
require("augroup")
-- vim.cmd.colorscheme("neon")
vim.cmd.colorscheme("material")
-- vim.cmd.colorscheme("palenightfall")
-- vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('onedark')
-- vim.cmd.colorscheme('doom-one')
