local wk = require('which-key')
_G.dstadelm = {
  mappings = {},
}
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

wk.register(
  {
    e = { ':e <C-R>=expand("%:p:h") . "/" <CR>', "Open file relative to current file"},
    s = { ':vsplit <C-R>=expand("%:p:h") . "/" <CR>', "Open file relative to current file"},
    p = {
      f = {':read <C-R>=expand("%:p:h") . "/" <CR>', "Read content of file to this file"},
      w = {'ciw<C-R>0<ESC>', "Delete word and replace with current yank"},
    },
    c = {
      d = { ':cd %:p:h<CR>', "Change working directory to directory of current file"}
    }
  },
  {
    prefix= '<leader>',
    mode  = 'n',
    silent = false,
  }
)

wk.register(
  {
    v = { ':e $MYVIMRC <CR>', "Open init.lua"},
    o = { ':edit $XDG_CONFIG_HOME/nvim/lua/plugins.lua<CR>', "Open plugins.lua"},
    w = { ':%s/\\s\\+$//gce \\| w<cr>', "Delete all trailing whitespace in current file"},
    a = {
      name = "All files in repo",
      w = { ':args `git grep -lI .` \\| argdo %s/\\s\\+$//gce \\| w<cr>', "Delete all trailing whitespace for each file in repo"}
    }
  },
  {
    prefix= '<leader>',
    mode  = 'n',
  }
)
--------------------------------------------------------------------------------
-- Initial idea from here http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
-- Mappings from here https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/Oli/core/mappings.lua
-- Discussion on the mappings https://github.com/akinsho/dotfiles/issues/9


-- Functions for multiple cursors
local mc = vim.api.nvim_replace_termcodes([[y/\V<C-r>=escape(@", '/')<CR><CR>]], true, true, true)

function dstadelm.mappings.setup_mc()
  vim.keymap.set(
    "n",
    "<Enter>",
    [[:nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z]],
    { remap = true, silent = true }
  )
  return ""
end

-- Word Mode
-- ==========
-- 1. Position in the cursor anywhere in the word you wish to change;
-- 2. Or, visually make a selection;
-- 3. Hit <leader>cn, type the new word, then go back to Normal mode;
-- 4. Hit `.` n-1 times, where n is the number of replacements.
--
-- Macro Mode
-- ==========
-- 1. Position the cursor over a word; alternatively, make a selection.
-- 2. Hit <leader>cq to start recording the macro.
-- 3. Once you are done with the macro, go back to normal mode.
-- 4. Hit Enter to repeat the macro over search matches.
wk.register(
  {
    c = {
      name = "multi cursor",
      n = {"*``cgn", "Multicursor change next occurance"}, -- equivalent to *Ncgn
      N = {"*``cgN", "Multicursor change previous occurance"}, -- equivalent to *NcgN
      q = {":<C-u>lua dstadelm.mappings.setup_mc()<CR>*``qz", "Multicursor change with macro"},
    }
  },
  {
    prefix= '<leader>',
    mode  = 'n',
  }
)

wk.register(
  {
    c = {
      name = "multi cursor",
      n = {mc .. "``cgn", "Multicursor change next occurance"}, -- instead of ``cgn one could use Ncgn
      N = {mc .. "``cgN", "Multicursor change previous occurance"}, -- instead of ``cgN one could use NcgN
      q = {":<C-u>call v:lua.dstadelm.mappings.setup_mc()<CR>gv" .. mc .. "``qz", "Multicursor change with macro"},
    }
  },
  {
    prefix= '<leader>',
    mode  = 'x',
  }
)
--------------------------------------------------------------------------------
-- Telescope <find>
wk.register(
  {
    f = {
      name = "find",
      b = {":lua require'telescope.builtin'.buffers()<CR>", "Find Buffers"},
      c = {":lua require'config.telescope_config'.find_nvim_config()<CR>", "Find Neovim Config"},
      f = {":lua require'telescope.builtin'.find_files()<CR>", "Find Files"},
      g = {":lua require'telescope.builtin'.live_grep()<CR>", "Grep in Project"},
      h = {":lua require'telescope.builtin'.help_tags()<CR>", "Find Help"},
      l = {":lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", "Find in Buffer"},
      r = {":lua require'telescope.builtin'.lsp_references()<CR>", "Find Reference"},
      o = {":lua require'telescope.builtin'.oldfiles()<CR>", "Find old files"},
    },
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
-- wk.register(
--   {
--     ["<C-W>"] = {
--       H = { ':exe "vert resize " . (winwidth(0) * 4/5)<CR>', "Decrease vertical window size by 4/5"},
--       K = { ':exe "resize " . (winheight(0) * 6/5)<CR>', "Increase horizontal window size by 6/5"},
--       J = { ':exe "resize " . (winheight(0) * 4/5)<CR>', "Decrease horizontal window size by 4/5"},
--       L = { ':exe "vert resize " . (winwidth(0) * 6/5)<CR>', "Increase vertical widnow size by 6/5"},
--     }
--   }
-- )
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
        s = { '<cmd>VhdlUpdateSensitivityList<cr><cr>' , "Update sensitivity list"},
        b = { '<cmd>VhdlBeautify<cr><cr>' , "Format buffer"},
      }
    },
    {
      prefix = '<localleader>',
      buffer = curr_buf,
    }
  )
end


vim.api.nvim_create_autocmd({"BufNew", "BufRead"}, {pattern="*.vhd", group=augroup_vhdl_buflocal_keymaps, callback = vhdl_buflocal_keymaps})
-------------------------------------------------------------------------------
-- Flog open commit folded
local flog_group = vim.api.nvim_create_augroup("FlogGroup", {clear = true})
local open_flog_folded = function()
  local curr_buf = vim.api.nvim_get_current_buf()
  wk.register(
    {
      ["<CR>"] = {":<C-U>call flog#run_tmp_command('vertical belowright Git show %h')<CR> <C-W>l :set foldmethod=syntax<CR>za", "Open commit under cursor"},
    },
    {
      buffer = curr_buf,
    }
  )
end
vim.api.nvim_create_autocmd("FileType", {pattern="floggraph", group=flog_group, callback=open_flog_folded})

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
