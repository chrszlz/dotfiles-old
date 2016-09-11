# Bindings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Colors and formatting
ESC=$(printf "\e")
BOLD=`tput bold`
RESET=`tput sgr0`

TEAL="$ESC[0;36m"
RED="$ESC[0;31m"
GRAY="$ESC[1;30m"
BRORANGE="$ESC[0;33m"

function print_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

# Prints path with highlighted root level git repos
function print_path {

	path=$PWD

	# Git repo
	if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]; then
		repo_path=$(git rev-parse --show-toplevel)
		repo_name=$(basename $repo_path)

		git_path=""

		# Not deeper than root level in Git repo
		if [ -d .git ]; then
			path=${path/$HOME/\~}
			dir_path=$(dirname $path)
			git_path="$dir_path/${TEAL}${BOLD}$repo_name"
		else
			post_path=${path/$repo_path}
			git_path="${TEAL}${BOLD}$repo_name${RESET}$post_path"
		fi

		echo "$git_path${RESET} ${RED}[$(print_git_branch)]"

	# Non-Git directory
	else
		path=${path/$HOME/\~}
		echo "$path${RESET}"
	fi
}

function print_time {
	echo "${GRAY}[$(date +"%T")]${RESET}"
}

export PS1='$(print_time) $(print_path)${RESET} 🐶  '
# $ export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H> \[\e[0m\]"

export PATH=$PATH:~/devtools/arcanist/bin

# Terminal color profile
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='cd ~/code'
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
alias o='open .'

# Git
source ~/.git-completion.bash

alias gs='git status -uno'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gp='git pull --rebase origin master'
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
alias gundo="git reset HEAD~"

alias gd="git diff"
alias gdd='git diff > ~/code/.diff; s ~/code/.diff'

alias gg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"
alias gssp='git stash show -p'

# Pinterest
alias dv='ssh devapp'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
