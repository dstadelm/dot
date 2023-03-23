local M = {}
M.nvim = {
  editor = {
    enabled = true,
    plugins = {
      undotree = true,
      eunuch = true,
      vinegar = true,
      easy_align = true,
      indent_blankline = true,
      exchange = true,
      yanky = true,
      dial = true,
      hydra = true,
      colorizer = true,
      treesitter = true,
    },
    completion = {
      enabled = true,
      plugins = {
        tabout = true,
        nvim_cmp = true,
      }
    },
    git = {
      enabled = true,
      plugins = {
        diffview = true,
        fugitiv = true,
        flog = true,
        gitsigns = true,
      }
    }
  },
  coding = {
    enabled = true,
    plugins = {
      projectionist = true,
      surround = true,
      comment = true,
      autopairs = true,
      iswap = true,
      cheat_sh = true,
      neotest = true,
      vunit = true,
      simple_vhdl = true,
      based = true,
    },
    lsp = {
      enabled = true,
      plugins = {
        lspconfig = true,
        lspsaga = true,
        neoconf = true,
        neodev = true,
        mason = true,
        trouble = true,
        null_ls = true,
        fidget = true, -- standalone ui for nvim-lsp progress
      }
    },
    dap = {
      enabled = true,
      plugins = {
        nvim_dap = true,
        nvim_dap_python = true,
      }
    },
  },
  colorschemes = {
    enabled = true,
    plugins = {
      ayu = true,
      neon = true,
      vscode = true,
      darcula = true,
      onedark = true,
      sonokai = true,
      doom = true,
      kanagawa = true,
      material = true,
      nightfox = true,
      oxocarbon = true,
      catppuccin = true,
      palenightfall = true,
    }
  },
  ui = {
    enabled = true,
    plugins = {
      maximize_window_toggle = true,
      toggleterm = true,
      notify = true,
      noice = false,
      alpha = true,
      lualine = true,
      telescope = true,
      which_key = true,
      dressing = true
    }
  }
}


function M.is_enabled(plugin)
  local function _is_enabled(key, table, group_enabled)
    local enabled = true
    for k, v in pairs(table) do
      if k == key then
        return v and group_enabled
      end
      if type(v) == "table" then
          enabled = _is_enabled(key, v, table.enabled == nil and group_enabled or (table.enabled and group_enabled)) and enabled
      end
    end
    return enabled
  end
  return _is_enabled(plugin, M.nvim, true)
end

return M
