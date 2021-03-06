vim.cmd('filetype plugin indent on')

vim.o.hidden = true
vim.o.ts = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true -- shows relative numbers
vim.o.showmatch = true -- show bracket matches
vim.o.ignorecase = true -- has to be enabled to make smartcase work, as smartcase overrides this option
vim.o.smartcase = true -- when searching using small case letters only the case is ignored
vim.o.incsearch = true -- show search results as I type
vim.wo.wrap = false -- don't wrap lines by default
vim.o.vb = true -- enable visual bell (disable audio bell)
vim.o.scrolloff = 2 -- minimum lines above/below cursor
vim.o.cursorline = true -- highlight current line very slow in putty
vim.o.foldenable = false -- code folding
vim.o.foldmethod = 'syntax'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.inccommand = 'split'
vim.o.wildmenu = true
vim.o.wildoptions = 'pum'
vim.o.pumblend = 10
vim.o.showmode = false -- do not show in which mode we are, as this is shown by airline
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus,unnamed'-- unamedplus -> ctrl-v; unamed -> middle mouse click
vim.o.mouse = 'a'
vim.o.diffopt = 'internal,filler,algorithm:histogram,iwhiteall,vertical'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.redrawtime = 10000

vim.o.undofile = true
vim.cmd([[
set undodir=~/.vimundo
]])


-- enable embeded script highlighting for lua and python
vim.g.vimsyn_embed   = 'lP'
--vim.g.python3_host_prog = '/home/dstadelmann/regenor/.pyenv-nvim/bin/python'
