local pc = require('plugin_configuration')
return {
  {
    'junegunn/vim-easy-align',
    enabled = pc.easy_align,
    config = function()
      vim.api.nvim_set_keymap("n", "ga", '<Plug>(EasyAlign)', { desc = "Easy Align"})
      vim.api.nvim_set_keymap("x", "ga", '<Plug>(EasyAlign)', { desc = "Easy Align"})
      vim.api.nvim_set_keymap("v", "<Enter", ":EasyAlign<CR>", { desc = "Easy Align"})
      -- inoremap(" &", "&<Esc>: call <SID>ampalign()<CR>a")
      --
      -- vim.cmd([[
      -- function! s:ampalign()
      --   let p = '^\s*&\s.*\s&\s*$'
      --   if exists(':EasyAlign') && getline('.') =~# '^\s*&' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      --     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      --     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      --     EasyAlign*&
      --     normal! 0
      --     call search(repeat('[^&]*&',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      --   endif
      -- endfunction
      -- ]])
      --
      -- vim.g.easy_align_delimiters = "{ '[' : { 'pattern': '[' }}"
    end,
  },
}
