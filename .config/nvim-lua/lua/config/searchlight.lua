-- Configuration of the highlight colors
-- =====================================
-- so $VIMRUNTIME/syntax/hitest.vim
-- :silent put =execute('hi Search')
-- setting the Searchlight to the original value of (one dark) Search
vim.cmd(" au VimEnter * hi! Searchlight ctermfg=235 ctermbg=180 guifg=#E5C07B guibg=#2c313a")
-- setting the Search highlight group to that of IncSearc
vim.cmd("au VimEnter * hi! Search ctermfg=180 ctermbg=59 guifg=#E5C07B guibg=#5C6370")
