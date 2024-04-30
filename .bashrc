# If not running interactively, don't do anything
[ -z "$PS1" ] && return
test -s ~/.alias && . ~/.alias || true
if [ -f /etc/scs-scripts/scs_settings.sh ]; then
    source /etc/scs-scripts/scs_settings.sh
fi


###############################################################
# Exports
###############################################################
BINPATH=${HOME}/bin/
if ! [[ "$PATH" =~ "$BINPATH" ]]; then
  export PATH="${HOME}/.go/src/github.com/junegunn/fzf/bin/:${HOME}/bin/":$PATH
  export GOPATH="${HOME}/.go"
fi
export TERM=xterm-256color

if [ -f /etc/bash_completion.d/git ];then
  . /etc/bash_completion.d/git
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

if [ -f /etc/profile.d/rvm.sh ];then
  . /etc/profile.d/rvm.sh
fi

if [ -f /etc/profile.d/modules.sh ];then
  . /etc/profile.d/modules.sh
fi


if [ $(command -v module) ]; then
  module use --append ${HOME}/.modules
fi

export NCURSES_NO_UTF8_ACS=1


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"
[ -f ~/.bash_ansible ] && . "$HOME/.bash_ansible"
. ~/.bash_alias
. ~/.bash_prompt
. ~/.bash_ssh_agent

export XDG_CONFIG_HOME=~/.config
export PATH="~/.local/bin:$PATH"

