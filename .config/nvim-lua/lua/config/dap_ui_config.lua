local nnoremap = require("utils").nnoremap
require("dapui").setup()
nnoremap("<leader>duo", ':lua require("dapui").open()<CR>', {silent = false})
nnoremap("<leader>duc", ':lua require("dapui").close()<CR>', {silent = false})
nnoremap("<leader>dut", ':lua require("dapui").toggle()<CR>', {silent = false})
nnoremap("<leader>de", ':lua require("dapui").eval()<CR>', {silent = false})

