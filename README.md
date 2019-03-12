# How I keep my home dir in Git with a detached working directory

Basically all is described in [Keep your home dir in Git...](knowhow/keep_your_home_dir_in_git.html).

There are three things to know!

1. Setup an alias 
	*	alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
2. Adding files
	* dgit add -f .my-dot-file
3. Cloning to new home
	* git clone ssh://git@tools.scs.ch:2222/scsuserrepos/dstadelmann.git ~/.dotfiles
	* alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
	* dgit reset --hard
