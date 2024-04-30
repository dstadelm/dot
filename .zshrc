# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#export TERM=xterm-256color-italic
export TERM=xterm-256color
export EDITOR=nvim
export XDG_CONFIG_HOME=${HOME}/.config
export FZF_DEFAULT_COMMAND='fdfind'
unsetopt BEEP

eval "$(direnv hook zsh)"
DISABLE_UNTRACKED_FILES_DIRTY="true"


bindkey -v
export KEYTIMEOUT=1

BINPATH="${BINPATH}:${HOME}/bin/"

if [ $(command -v module) ]; then
  module use --append ${HOME}/.modules
fi

#export NCURSES_NO_UTF8_ACS=1

. ~/.bash_ssh_agent
# WSL specific
if [[ -v WSLENV ]] then
  export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0.0
  export LIBGL_ALWAYS_INDIRECT=1
fi


# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

function root(){
  $(git root)
}

function v(){
  if [[ -S $NVIM_LISTEN_ADDRESS ]]; then
    nvr -c "tab drop $argv | set bufhidden=delete"
  else
    nvr -s $argv
  fi
}

# alias luamake=/home/dstadelmann/bin/lua-language-server/3rd/luamake/luamake

. ~/.bash_alias
. ~/.zsh_ansible

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
