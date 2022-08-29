local wk = require('which-key')
wk.setup{
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}


--------------------------------------------------------------------------------
-- Window mappings
-- ---------------
wk.register(
  {
    ["<C-W>"] = {
      H = { ':exe "vert resize " . (winwidth(0) * 4/5)<CR>', "Decrease vertical window size by 4/5"},
      K = { ':exe "resize " . (winheight(0) * 6/5)<CR>', "Increase horizontal window size by 6/5"},
      J = { ':exe "resize " . (winheight(0) * 4/5)<CR>', "Decrease horizontal window size by 4/5"},
      L = { ':exe "vert resize " . (winwidth(0) * 6/5)<CR>', "Increase vertical widnow size by 6/5"},
    }
  }
)
--------------------------------------------------------------------------------
-- Terminal mode mappings
-- ----------------------
--
-- only use this if you are using vim mode in the terminal otherwise you will
-- be missing ctrl-w for backstepping a word...
--
wk.register(
  {
    ["<C-W>"] = {
      h = { "<C-\\><C-N><C-W-h>"},
      j = { "<C-\\><C-N><C-W-j>"},
      k = { "<C-\\><C-N><C-W-k>"},
      l = { "<C-\\><C-N><C-W-l>"},
    }
  },
  { mode = "t" }
)


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
        s = { '<cmd>VhdlUpdateSensitivityList<cr>' , "Update sensitivity list"},
        b = { '<cmd>VhdlBeautify<cr>' , "Format buffer"},
      }
    },
    {
      prefix = '<localleader>',
      buffer = curr_buf,
    }
  )

end


vim.api.nvim_create_autocmd({"BufNew"}, {pattern="*.vhd", group=augroup_vhdl_buflocal_keymaps, callback = vhdl_buflocal_keymaps})

