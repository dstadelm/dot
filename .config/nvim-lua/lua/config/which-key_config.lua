local wk = require('which-key')
wk.setup{
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

wk.register{
    n = {"nzzzv", "Go to next search occurance"},
    N = {"Nzzzv", "Go to previous search occurance"},
    -- ["<C-D>"] = {"<C-D>zzzv", "Scroll half page down"},
    -- ["<C-U>"] = {"<C-U>zzzv", "Scroll half page up"},
    -- ["<C-F>"] = {"<C-F>zzzv", "Scroll half page down"},
    -- ["<C-B>"] = {"<C-B>zzzv", "Scroll half page up"},
}
--------------------------------------------------------------------------------
-- Telescope <find>
wk.register(
  {
    f = {
      name = "find",
      c = {":lua require'config.telescope_config'.find_nvim_config()<CR>", "Find Neovim Config"},
      f = {":lua require'telescope.builtin'.find_files()<CR>", "Find Files"},
      g = {":lua require'telescope.builtin'.live_grep()<CR>", "Grep in Project"},
      h = {":lua require'telescope.builtin'.help_tags()<CR>", "Find Help"},
      l = {":lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", "Find in Buffer"},
      r = {":lua require'telescope.builtin'.lsp_references()<CR>", "Find Reference"},
      o = {":lua require'telescope.builtin'.oldfiles()<CR>", "Find old files"},
    },
    b = {":lua require'telescope.builtin'.buffers()<CR>", "Find Buffers"},
  },
  {
    prefix = '<leader>',
  }
)


--------------------------------------------------------------------------------
-- Neotest
--
wk.register(
  {
    t = {
      name = "test",
      a = {":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run all tests in file"},
      n = {":lua require('neotest').run.run()<CR>", "Run nearest tests in file"},
      s = {":lua require('neotest').summary.toggle()<CR>", "Toggle test summary"},
      o = {":lua require('neotest').output.open({enter=true})<CR>", "Inspect output"}
    }
  },
  {
    prefix = '<leader>',
  }
)

wk.register({
  ["]n"] = { ':lua require("neotest").jump.next({ status = "failed" })<CR>', "Jump to next failed test"},
  ["[n"] = { ':lua require("neotest").jump.prev({ status = "failed" })<CR>', "Jump to previous failed test"},
})
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
local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end
wk.register(
  {
    ["<C-W>"] = {
      name = "Window",
      h = { termcodes("<C-\\><C-n><C-W>h"), "Move left"},
      j = { termcodes("<C-\\><C-n><C-W>j"), "Move down"},
      k = { termcodes("<C-\\><C-n><C-W>k"), "Move up"},
      l = { termcodes("<C-\\><C-n><C-W>l"), "Move right "},
    },
    [",,"] = {termcodes("<C-\\><C-n>"), "Normal mode"},
  },
  { mode = "t" }
)
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

