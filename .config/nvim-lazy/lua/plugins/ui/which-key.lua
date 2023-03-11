local pc = require('plugin_configuration')
return {
  "folke/which-key.nvim",
  enabled = pc.which_key,
  config = function()
    local wk = require('which-key')
    _G.dstadelm = {
      mappings = {},
    }
    wk.setup{
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }



    wk.register( { c = { name = "change", } }, { prefix= '<leader>', mode  = 'n', })
    wk.register( { c = { name = "change", } }, { prefix= '<leader>', mode  = 'x', })
    wk.register( { d = { name = "delete", } }, { prefix= '<leader>', mode  = 'n', })
    wk.register( { d = { name = "delete", } }, { prefix= '<leader>', mode  = 'x', })
    --------------------------------------------------------------------------------
    -- Telescope <find>
    wk.register({f = {name = "find"}}, { prefix = '<leader>'})


    --------------------------------------------------------------------------------
    -- refactoring
    wk.register({
      r = {
        name = 'refactoring',
        e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", 'extract function' },
        f = {
          [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
          'extract function to file',
        },
        v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], 'extract variable' },
        i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], 'inline variable' },
        r = { [[ <Esc><Cmd>lua require('refactoring').select_refactor()<CR> ]], 'select refactoring' },
      },
    }, {
        prefix = '<leader>',
        mode = 'v',
      })
    wk.register({
      r = {
        name = 'refactoring',
        b = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], 'extract block' },
        f = {
          [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
          'extract function to file',
        },
        i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], 'inline variable' },
      },
    }, {
        prefix = '<leader>',
      })

    --------------------------------------------------------------------------------
    -- VHDL Buffer local mappings
    local augroup_vhdl_buflocal_keymaps = vim.api.nvim_create_augroup("vhdl_buflocal_keymaps", {clear = true})

    local vhdl_buflocal_keymaps = function()
      local curr_buf = vim.api.nvim_get_current_buf()
      wk.register(
        {
          v = {
            name = "VHDL",
            i = { '<cmd>VhdlInsertInstanceFromTag<cr>' , "Insert an instance from tags"},
            c = { '<cmd>VhdlUpdateCtags<cr>' , "Update vhdl ctags"},
            p = { '<cmd>VhdlPasteSignals<cr>' , "Paste signals from copied instance"},
            s = { '<cmd>VhdlUpdateSensitivityList<cr><cr>' , "Update sensitivity list"},
            b = { '<cmd>VhdlBeautify<cr><cr>' , "Format buffer"},
          }
        },
        {
          prefix = '<leader>',
          buffer = curr_buf,
        }
      )
    end


    vim.api.nvim_create_autocmd({"BufNew", "BufRead"}, {pattern="*.vhd", group=augroup_vhdl_buflocal_keymaps, callback = vhdl_buflocal_keymaps})

    --------------------------------------------------------------------------------
    -- Norg mappings
    --
    local augroup_norg_buflocal_keymaps = vim.api.nvim_create_augroup("ag_norg_buflocal_keymaps", {clear = true})
    local norg_buflocal_keymaps = function()
      local curr_buf = vim.api.nvim_get_current_buf()
      wk.register(
        {
          ["p"] = { '<cmd>Neorg presenter start<cr><cmd>set nonumber norelativenumber conceallevel=3<cr>' , "Start presenter mode"},
        },
        {
          prefix = '<localleader>',
          buffer = curr_buf,
        }
      )
    end

    vim.api.nvim_create_autocmd({"BufNew", "BufRead"}, {pattern="*.norg", group=augroup_norg_buflocal_keymaps, callback = norg_buflocal_keymaps})
  end
}
