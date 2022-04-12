local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vhdl = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-vhdl",
    files = {"src/parser.c"},
    branch = 'main'
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
      enable = true,
      disable = { "help" }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>gi",
      node_incremental = "<leader>gn",
      scope_incremental = "<leader>gs",
      node_decremental = "<leader>gd",
    },
    disable = { "help" }
  },
  indent = {
    enable = true,
    disable = {"yaml", "help"}
  },

}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'


