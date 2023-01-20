local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
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
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vhdl = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-vhdl",
    files = { "src/parser.c" },
    branch = 'main'
  }
}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"vhdl"},
  highlight = {
    enable = true,
    disable = { "help" , "vhdl"}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>;",
      node_incremental = "<leader>,",
      scope_incremental = "<leader>gs",
      node_decremental = "<leader>.",
    },
    disable = { "help" }
  },
  indent = {
    enable = true,
    disable = { "yaml", "help" }
  },

}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

require 'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["as"] = "@block.outer",
        ["is"] = "@block.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ['@block.outer'] = 'V', -- linewise
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
  },
}
