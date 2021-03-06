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
    {'tpope/vim-commentary'},
    {'tpope/vim-projectionist'},
    {'tpope/vim-surround'},
    {'tpope/vim-eunuch'},
    {'tpope/vim-vinegar'},
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
      'ray-x/lsp_signature.nvim',
    },
    config = get_config('lsp_config'),
  }

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
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'nvim-treesitter/playground',
    },
    run = ':TSUpdate',
    config = get_config('treesitter-cfg'),
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
    'beauwilliams/focus.nvim',
    config = function() require("focus").setup({excluded_filetypes = {"DiffviewFiles"}}) end
  }


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
    'airblade/vim-rooter',
    config = [[
      vim.g.rooter_patterns = { '.git' }
    ]]
  }

  use { 'mg979/vim-visual-multi' }

  use {
    'junegunn/vim-easy-align',
    config = get_config('easy-align'),
  }

  use {
    'vimwiki/vimwiki',
    config = function()
      vim.cmd([[let g:vimwiki_listsyms = '???????????????']])
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

  use { 'fadein/vim-FIGlet' }

  use {
    'mhinz/vim-startify',
    config = get_config('startify'),
  }

  use {
    'dstadelm/simple-vhdl.vim',
    config = get_config('simple-vhdl'),
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

  use {
    'PeterRincker/vim-searchlight',
    config = get_config('searchlight')
  }


  -- Git Integration
  use {
    {'junegunn/gv.vim'},
    {'tpope/vim-fugitive'},
  }

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
    'rcarriga/vim-ultest',
    requires = {
      'vim-test/vim-test'
    }
  }
  -- Themes
  use { 'Shatur/neovim-ayu' }
  use { 'Julpikar/night-owl.nvim' }
  use { 'rafamadriz/neon' }
  use { 'Mofiqul/dracula.nvim' }
  use {
    'marko-cerovac/material.nvim',
    config = get_config('material_cfg')
  }
  use {
    'olimorris/onedarkpro.nvim',
    config = get_config('onedarkpro_cfg')
  }
  use {
    'Mofiqul/vscode.nvim',
    config = get_config('vscode_cfg')
  }
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker',
        term_colors = 'false'
      }
      --require('onedark').load()
    end
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
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons'},
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '\\', right = '/'},
          section_separators = { left = '???', right = '???'},
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
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
  }
}
}
)

