packadd vim-projectionist
call minpac#add('tpope/vim-projectionist', {'type': 'opt'})

" A .projections.json for vhdl / tb files
"{
"    "**/hdl/*.vhd": {
"      "type": "source",
"      "alternate": "{dirname}/tb/tb_{basename}.vhd"
"    },
"    "**/tb/tb_*.vhd": {
"      "type": "tb",
"      "alternate": "{dirname}/hdl/{basename}.vhd"
"    }
"}
