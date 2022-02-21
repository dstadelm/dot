local nnoremap = require("utils").nnoremap

vim.g.VunitInvocationCmd = 'vunit'
vim.g.VunitGuiPreCmd = 'export $(tmux show-env | grep DISP);'

nnoremap("<leader>vr", ":VunitRunTestWithFzf<CR>")
nnoremap("<leader>vg", ":VunitRunTestWithFzfInGui<CR>")
nnoremap("<leader>vl", ":VunitUpdateTestList<CR>")
nnoremap("<leader>rr", ":VunitReRunSelectedTests<CR>")

