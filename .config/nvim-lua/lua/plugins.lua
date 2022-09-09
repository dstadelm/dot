local function get_config(cfg)
  return string.format("require('config/%s')",cfg)
end

--------------------------------------------------------------------------------
-- This section has to be before the startup function
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
--
--------------------------------------------------------------------------------

return require('packer').startup({function(use)
  -- Packer can manage it self
  use 'wbthomason/packer.nvim'

  -- tpope plugins
  use {
    -- {'tpope/vim-commentary'},
    {'tpope/vim-projectionist'},
    {'tpope/vim-eunuch'},
    {'tpope/vim-vinegar'},
  }

  use {
    'kylechui/nvim-surround',
    config = get_config('nvim-surround')
  }

  use {
    'numToStr/Comment.nvim',
    config = get_config('comment')
  }

  use {
    "windwp/nvim-autopairs",
    config = get_config("nvim-autopairs")
  }

  use {
    'neomake/neomake',
    config = get_config('neomake'),
  }

  use { 'mbbill/undotree' }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'glepnir/lspsaga.nvim',
    },
    config = get_config('lsp_config'),
  }
  use { 'folke/lua-dev.nvim' }
  use {
    'williamboman/nvim-lsp-installer',
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = get_config('null-ls_config'),
  }

  use { 'caenrique/nvim-maximize-window-toggle' }

  use { 'simrat39/symbols-outline.nvim' }

  use { 'sindrets/diffview.nvim' }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'SirVer/ultisnips',
        config = get_config('snippets'),
      },

      'honza/vim-snippets',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'lukas-reineke/cmp-under-comparator',
      'hrsh7th/cmp-cmdline',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },

    config = get_config('completion'),
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    run = ':TSUpdate',
    config = get_config('treesitter_config'),
  }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    },
    config = get_config('refactoring')
  }
  use {
    'nvim-treesitter/nvim-treesitter-context'
  }

  use {
    'mizlan/iswap.nvim',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = get_config('telescope_config'),
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'cljoly/telescope-repo.nvim',
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }
  }

  use {
    'mfussenegger/nvim-dap',
    config = get_config('dap_config')

  }
  use {
    'mfussenegger/nvim-dap-python',
    requires = {"mfussenegger/nvim-dap"},
    config = get_config('dap_python_config')
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = get_config('dap_ui_config')
  }

  use {
    'junegunn/fzf',
    requires = {'junegunn/fzf.vim',},
    config = get_config('fzf'),
  }

  use {
    'voldikss/vim-floaterm',
    config = [[
    vim.g.floaterm_gitcommit = 'vsplit'
    vim.g.floaterm_wintype = 'split'
    ]],
  }

  use {
    'notjedi/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
  }

  use {
    "ahmedkhalf/project.nvim",
    config = get_config('project_config')
  }

  use {
    'junegunn/vim-easy-align',
    config = get_config('easy-align'),
  }

  use {
    'vimwiki/vimwiki',
    config = function()
      vim.cmd([[let g:vimwiki_listsyms = '✗○◐●✓']])
    end
  }


  use {
    "nvim-neorg/neorg",
    config = get_config("neorg_config"),
    requires = {
      'nvim-lua/plenary.nvim',
      'folke/zen-mode.nvim',
    }

  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  use { 'rhysd/vim-grammarous' }

  -- scrolling
  use { 'yuttie/comfortable-motion.vim' }

  use {
    'mhinz/vim-startify',
    config = get_config('startify'),
  }

  use {
    'dstadelm/simple-vhdl.vim',
  }

  use {
    'dstadelm/vim-vunit',
    config = get_config('vunit'),
  }
  -- python
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = get_config('indent')
  }

  use { 'tommcdo/vim-exchange' }

  use {
    'lervag/vimtex',
    config = get_config('latex'),
  }

  -- Git Integration
  use {'tpope/vim-fugitive'}
  use {'powerman/vim-plugin-AnsiEsc'}
  use {'rbong/vim-flog'}
  -- {'skywind3000/vim-quickui'},
  -- {'TamaMcGlinn/flog-menu'},
  -- use {
  --   'TamaMcGlinn/flog-forest',
  -- }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = get_config('gitsigns_config')
  }

  use { 'dbeniamine/cheat.sh-vim' }
  -- testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = get_config("neotest_config"),
  }
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup{}
    end
  }

  use {
    "folke/which-key.nvim",
    config = get_config('which-key_config'),
  }

  -- use { 'gabrielpoca/replacer.nvim' }
  -- Themes
  use { 'rebelot/kanagawa.nvim' }
  use { 'Shatur/neovim-ayu' }
  use { 'Julpikar/night-owl.nvim' }
  use { 'rafamadriz/neon' }
  use { 'Mofiqul/dracula.nvim' }
  use {
    'marko-cerovac/material.nvim',
    config = get_config('material_config')
  }
  use {
    'olimorris/onedarkpro.nvim',
    config = get_config('onedarkpro_config')
  }
  use {
    'sainnhe/sonokai',
  }
  use { 'EdenEast/nightfox.nvim' }
  use { 'RRethy/nvim-base16' }
  use {
    'Mofiqul/vscode.nvim',
    config = get_config('vscode_config')
  }


  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons'},
    config = get_config('lualine_config')
  }

  use {
    'NTBBloodbath/doom-one.nvim',
    config = get_config('doom-one_config')
  }

  use{
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = get_config('lsp_lines_config'),
  }

  use {
    'lukas-reineke/headlines.nvim',
    config = get_config("headlines_config")
  }
  -- has to be after the themes
  use {
    'norcalli/nvim-colorizer.lua',
    config = get_config('colorizer_config'),
  }

  ---- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    },
    profile = {
      enable = true,
      threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }
}
)

