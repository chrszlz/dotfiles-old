# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Terminal color profile
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='cd ~/Dev'
alias ds='cd ~/Desktop'

# Apps
alias s='open -a "Sublime Text"'

# Commands
alias la='ls -a'
alias ll='ls -a -l'
alias rmf='rm -rf'
alias c='clear'
alias prof='s ~/.bash_profile'
alias src='source ~/.bash_profile'

# Git
alias gs='git status -uno'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gp='git pull --rebase'
alias grc='git rebase --continue'
alias gpp='git push'
alias gl='git log --decorate --oneline'
alias gcl='git clone'
alias gsu="git submodule update --init --recursive"
alias gss="git submodule sync"
alias gco="git checkout "
alias gst="git stash"
alias gsr="git stash --keep-index"
alias gsp="git stash pop"
alias gd="git diff"
alias gg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"
alias gssp='git stash show -p'
