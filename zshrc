# zsh setup and prompt borrowed from @pilif (http://github.com/pilif)

function check_path(){
  which $1 2>&1 > /dev/null
}

export EDITOR="vim"
export LANG=en_US.utf-8
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey    "^[[3~"  delete-char
bindkey    "^[3;5~" delete-char
bindkey    "^A"     beginning-of-line
bindkey    "^E"     end-of-line
bindkey    "\eOH"   beginning-of-line
bindkey    "\eOF"   end-of-line
bindkey    "^r"     history-incremental-search-backward

setopt nonomatch

case $TERM in
    *xterm*|ansi)
	# Put the penultimate and current directory in the iterm tab:
		function settab { print -Pn "\e]1;%n@%m: %~\a" }
	# Put the string " [zsh]   hostname::/full/directory/path" in the title bar:
		function settitle { print -Pn "\e]2;%n@%m: %~\a" }

        # This updates before each prompt:
        precmd () { settab;settitle }
		settab;settitle
        ;;
esac

setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS AUTO_CD AUTO_PUSHD NO_BEEP LIST_AMBIGUOUS AUTO_MENU


########################
# PATH

export PATH="/usr/local/bin:$PATH:$HOME/bin"

if [ `uname -s` = "Linux" ]; then
  export PATH="$HOME/opt/android-sdk-linux_x86/tools:$PATH"
  export PATH="$HOME/opt/android-sdk-linux_x86/platform-tools:$PATH"
fi

if [ `uname -s` = "Darwin" ]; then
  # android sdk
  export PATH=$PATH:$HOME/opt/android-sdk/tools
  export PATH=$PATH:$HOME/opt/android-sdk/platform-tools

  # node.js
  export NODE_PATH=/usr/local/lib/node_modules
fi

# RVM support
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

########################
# Aliases

alias vi=vim

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias p='ps aux'

alias pgrep='grep --color=auto -P'

alias g='git'
alias gs='git status -s'
alias gd='git diff'
alias gdc='git diff --cached'
alias grl='git log --reverse --pretty=oneline'
alias gsm='grl master..'

if [ `uname -s` = "Linux" ]; then
  alias search='apt-cache search'
  alias show='apt-cache show'
  alias open='gnome-open'
  alias ack='ack-grep'
  alias ls='ls --color=auto'
fi

if [ `uname -s` = "Darwin" ]; then
  if check_path 'gsed'; then
    alias sed=gsed
  fi

  if check_path 'gfind'; then
    alias find=gfind
  fi

  alias ls='ls -G'
  alias search='port search'
fi

########################

echo "autoloading functions..."
fpath=(~/.zshfunc $fpath)
autoload -U promptinit
autoload -U compinit
echo "init completitions..."
compinit
echo "init prompt..."
promptinit
if [[ $ZSH_VERSION == "4.3.4" ]]; then
  prompt pilif
else
  prompt pilif2 green blue green
fi
