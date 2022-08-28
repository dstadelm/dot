local wk = require('which-key')
wk.setup{
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local augroup_vhdl_buflocal_keymaps = vim.api.nvim_create_augroup("vhdl_buflocal_keymaps", {clear = true})

local vhdl_buflocal_keymaps = function()
  local curr_buf = vim.api.nvim_get_current_buf()
  wk.register(
    {
      v = {
        name = "VHDL",
        i = { '<cmd>VhdlInsertInstanceFromTag<cr>' , "Insert an instance from tags"},
      }
    },
    {
      prefix = '<localleader>',
      buffer = curr_buf,
    }
  )

end


vim.api.nvim_create_autocmd({"BufNew"}, {pattern="*.vhd", group=augroup_vhdl_buflocal_keymaps, callback = vhdl_buflocal_keymaps})

