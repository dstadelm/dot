# If not running interactively, don't do anything
[ -z "$PS1" ] && return
test -s ~/.alias && . ~/.alias || true
if [ -f /etc/scs-scripts/scs_settings.sh ]; then
    source /etc/scs-scripts/scs_settings.sh
fi


###############################################################
# Exports
###############################################################
export ECLIPSE_HOME="~/bin/eclipse"
export PATH=".:/usr/scs/dstadelmann/bin/eclipse:~/bin/":$PATH
${HOME}/bin/bin/vim --version &> /dev/null && export PATH="${HOME}/bin/bin":$PATH
export TERM=xterm-256color

if [ -f /etc/bash_completion.d/git ];then
  . /etc/bash_completion.d/git
fi

if [ -f /etc/profile.d/rvm.sh ];then
  . /etc/profile.d/rvm.sh
fi

# Enable colors in less

OCCURENCE=$(echo $LESS | grep -c "\-R")
if [[ $OCCURENCE -eq 0 ]]; then
    export LESS="${LESS} -R"
fi

. ~/.bash_alias
. ~/.bash_prompt
#. ~/.bash_ssh_agent
