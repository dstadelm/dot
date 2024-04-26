# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dstadelmann/.oh-my-zsh"
#export TERM=xterm-256color-italic
export TERM=xterm-256color
export EDITOR=nvim
export XDG_CONFIG_HOME=${HOME}/.config
export FZF_DEFAULT_COMMAND='fdfind'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
unsetopt BEEP
#
eval "$(direnv hook zsh)"
###############################################################################
#
# Theme -> moved to .zsh_prompt
#
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
#ZSH_THEME="bureau"
#ZSH_THEME="amuse"
#ZSH_THEME="candy-kingdom"
#ZSH_THEME="crcandy"
#ZSH_THEME="emotty"
#ZSH_THEME="fino"
#ZSH_THEME="fino-time"
#ZSH_THEME="gianu"
#ZSH_THEME="half-life"
#ZSH_THEME="itchy"
#ZSH_THEME="jonathan"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"
#ZSH_THEME="alanpeabody"
#ZSH_THEME="avit"
##ZSH_THEME="gnzh"
#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
###############################################################################
#eval "$(starship init zsh)"
fpath+=$HOME/.oh-my-zsh/custom/plugins/pure
autoload -U promptinit; promptinit
prompt pure
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
  colored-man-pages
)


# auto jump says to add these lines when calling the install.py script
#        [[ -s /home/dstadelmann/.autojump/etc/profile.d/autojump.sh ]] && source /home/dstadelmann/.autojump/etc/profile.d/autojump.sh
#
#        autoload -U compinit && compinit -u

# colored-man-pages)

source $ZSH/oh-my-zsh.sh
###############################################################################
# VIM editing mode on the command line
# for emacs style switch to -e
#
# https://dougblack.io/words/zsh-vi-mode.html
# bindkey -v
#
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward
#
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#     zle reset-prompt
# }
#
# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1
#
###############################################################################

bindkey -v
export KEYTIMEOUT=1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
BINPATH=""
BINPATH="${BINPATH}:${HOME}/bin/"
BINPATH="${BINPATH}:${HOME}/bin/rust_hdl/target/release"
BINPATH="${BINPATH}:${HOME}/.cargo/bin/"
BINPATH="${BINPATH}:${HOME}/.go/bin/"
BINPATH="${BINPATH}:${HOME}/.go/src/github.com/junegunn/fzf/bin/"
BINPATH="${BINPATH}:${HOME}/.local/share/nvim/lsp_servers/latex/"
export DENO_INSTALL="${HOME}/.deno"
BINPATH="${BINPATH}:${DENO_INSTALL}/bin"
if ! [[ "$PATH" =~ "$BINPATH" ]]; then
  export PATH="${BINPATH}:${PATH}"
  export GOPATH="${HOME}/.go"
fi


if [ $(command -v module) ]; then
  module use --append ${HOME}/.modules
fi

#export NCURSES_NO_UTF8_ACS=1

. ~/.bash_ssh_agent
#. ~/.zsh_prompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# WSL specific
if [[ -v WSLENV ]] then
  export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0.0
  export LIBGL_ALWAYS_INDIRECT=1
fi

#dbus_status=$(service dbus status)
#if [[ $dbus_status = *"is not running"* ]]; then
#  sudo service dbus --full-restart
#fi
source ~/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:completion:*:cd:*' ignore true

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
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
