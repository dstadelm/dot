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
  --
  use {
    'neomake/neomake',
    config = get_config('neomake'),
  }

  use { 'mbbill/undotree' }

  --
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'glepnir/lspsaga.nvim',
      'ray-x/lsp_signature.nvim',
    },
    config = get_config('lsp_config'),
  }

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
    },

    config = get_config('completion'),
  }
  --
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
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = get_config('telescope_config'),
  }

  use {
    'beauwilliams/focus.nvim',
    config = function() require("focus").setup() end
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
    'junegunn/fzf',
    requires = {'junegunn/fzf.vim',},
    config = get_config('fzf'),
  }

  use {
    'voldikss/vim-floaterm',
    config = [[vim.g.floaterm_gitcommit = 'vsplit']],
  }

  use {
    'airblade/vim-rooter',
    config = [[ vim.g.rooter_manual_only = 1 ]],
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
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              }
            }
          },
          ["core.norg.concealer"] = {},
          ["core.norg.qol.toc"] = { config = {default_split_mode = "split"}}
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  use { 'rhysd/vim-grammarous' }

  -- replaced by augroup cmd
  -- use {
  --   'machakann/vim-highlightedyank',
  --   config = [[vim.g.highlightedyank_highlight_duration = 1000]],
  -- }
  -- scrolling
  use { 'yuttie/comfortable-motion.vim' }

  use { 'fadein/vim-FIGlet' }

  use { 'mhinz/vim-startify' }

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

  -- folding
  --use { 'tmhedberg/SimpylFold', } -- TODO better folding (is there something with treesitter?)
  --use { 'pedrohdz/vim-yaml-folds' }

  -- All plugins I've tried so far make the cursor movement extremly laggy
  -- highlight the words under the cursor
  --  use {
  --    'RRethy/vim-illuminate',
  --    config = get_config('illuminate'),
  --  }

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
      --'airblade/vim-gitgutter',
      --  config = [[vim.g.updatetime=100]]
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
  --use {
  --  'ful1e5/onedark.nvim',
  --  config = get_config('onedark_config'),
  --}

  --use {
  --  'NTBBloodbath/doom-one.nvim',
  --  config = function()
  --    require('doom-one').setup {
  --      cursor_coloring = false,
  --      terminal_colors = false,
  --      italic_comments = false,
  --      enable_treesitter = true,
  --      transparent_background = false,
  --      pumblend = {
  --        enable = true,
  --        transparency_amount = 20,
  --      },
  --      plugins_integrations = {
  --        neorg = true,
  --        barbar = true,
  --        bufferline = false,
  --        gitgutter = false,
  --        gitsigns = true,
  --        telescope = false,
  --        neogit = true,
  --        nvim_tree = true,
  --        dashboard = true,
  --        startify = true,
  --        whichkey = true,
  --        indent_blankline = true,
  --        vim_illuminate = true,
  --        lspsaga = false,
  --      },
  --    }
  --  end,
  --}

  use {
    'navarasu/onedark.nvim',
    config = function()-- Lua
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  }
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons'},
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'onedark',
          component_separators = { left = '\\', right = '/'},
          section_separators = { left = '', right = ''},
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

