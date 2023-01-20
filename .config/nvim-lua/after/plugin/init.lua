vim.cmd([[
" let g:flog_build_log_command_fn = 'flog#build_git_forest_log_command'
"let g:flog_forest_exec = "/home/dstadelmann/bin/git-forest"
let g:flog_use_ansi_esc = 1
let g:flog_default_arguments={"format":"%C(brightmagenta)%h%C(white)%C(yellow)%d%C(white)%x1b[0m%x20%s %Cgreen(%cd) %C(cyan)<%an>%Creset"}
]])
