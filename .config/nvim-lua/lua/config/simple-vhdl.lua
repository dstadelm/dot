local nnoremap = require("utils").nnoremap

nnoremap("<leader>vi", ":VhdlInsertInstanceFromTag<CR>")
nnoremap("<leader>vc", ":VhdlUpdateCtags<CR>")
nnoremap("<leader>vp", ":VhdlPasteSignals<CR>")
nnoremap("<leader>vs", ":VhdlUpdateSensitivityList<CR>")
nnoremap("<leader>vb", ":VhdlBeautify<CR>")
