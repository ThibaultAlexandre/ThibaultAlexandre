# ~/.bashrc for macOS

# Silence warnings
export BASH_SILENCE_DEPRECATION_WARNING=1

# Make sure brew is added to the Path
eval "$(/opt/homebrew/bin/brew shellenv)"


# Use extended globbing
shopt -s extglob

# Enable colors for ls and grep
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Define colors
BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
BRIGHT_RED='\[\033[1;31m\]'
BRIGHT_GREEN='\[\033[1;32m\]'
BRIGHT_YELLOW='\[\033[1;33m\]'
BRIGHT_BLUE='\[\033[1;34m\]'
BRIGHT_PURPLE='\[\033[1;35m\]'
BRIGHT_CYAN='\[\033[1;36m\]'
BRIGHT_WHITE='\[\033[1;37m\]'
RESET_COLOR='\[\033[0m\]'

# Function to parse git branch
parse_git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

# Colorize the prompt with user, host, current directory, and git branch
PS1="${BRIGHT_GREEN}\u${WHITE}@${BRIGHT_BLUE}\h ${BRIGHT_YELLOW}\w${BRIGHT_PURPLE} \$(parse_git_branch)${RESET_COLOR}\$ "

# Enable autocompletion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# Function to display disk usage
dusage() {
  df -h | grep -E '^(/dev|Filesystem|map)'
}

# Function to extract various archive types
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Export custom aliases and functions
export -f dusage
export -f extract

# Activate Python environment
source "$HOME/venv/bin/activate"

# Alias definitions
alias ls='ls -GFh'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'
alias gs='git status'

# Specific alias definition
alias gcode="cd ~/Documents/code"
alias gdot="cd ~/Documents/code/ThibaultAlexandre; git status"
alias gtr="cd ~/Documents/code/trading; git status"