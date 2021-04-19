call minpac#add('nvim-treesitter/nvim-treesitter', {'type': 'opt', 'do': ':TSUpdate'})
call minpac#add('nvim-treesitter/playground', {'type': 'opt'})
packadd nvim-treesitter
packadd playground


" add vhdl parser
lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vhdl = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-vhdl",
    files = {"src/parser.c"},
    branch = 'main'
  }
}

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>gi",
      node_incremental = "<leader>gn",
      scope_incremental = "<leader>gs",
      node_decremental = "<leader>gd",
    },
  },
}

EOF
