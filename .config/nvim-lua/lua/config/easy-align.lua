local vnoremap = require("utils").vnoremap
local inoremap = require("utils").inoremap
local nmap = require("utils").nmap
local xmap = require("utils").xmap
nmap('ga', '<Plug>(EasyAlign)')
xmap('ga', '<Plug>(EasyAlign)')
vnoremap(' <Enter>', ":EasyAlign<CR>")

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
