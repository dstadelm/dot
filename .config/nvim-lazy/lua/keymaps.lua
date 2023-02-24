local map = require("utils").map
local nmap = require("utils").nmap
local imap = require("utils").imap
local vmap = require("utils").vmap
local tmap = require("utils").tmap
local nnoremap = require("utils").nnoremap
local inoremap = require("utils").inoremap
local vnoremap = require("utils").vnoremap
local tnoremap = require("utils").tnoremap

nnoremap("<leader>z", ':ToggleOnly<CR>')

-- add mapping to be able to move around lines
inoremap("<C-k>", "<esc>:m .-2<CR>==i")
inoremap("<C-j>", "<esc>:m .+1<CR>==i")
nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")

-- move around visually selected lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

vim.cmd("cabbrev Q q")
vim.cmd("cabbrev W w")
vim.cmd("cabbrev Wq wq")

nnoremap("<F10>", ":FloatermToggle<CR>")
tnoremap("<F10>", "<C-\\><C-N>:FloatermToggle<CR>")
