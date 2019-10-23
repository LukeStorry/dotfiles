
alias c='clear'
alias ls='ls --color=auto'
alias l-'ls'
alias ll='ls -la'
alias h='history'

# bash history settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000


# make escpaing directories easy
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

# useful git shortcuts
alias gl='git log --oneline'
alias gs='git status'
alias gfp='git push --force-with-lease'
alias gcl='git clean -i -d -x'
alias gam='git commit --amend -m "'
alias gres='git reset HEAD --mixed'
alias gresh='git reset HEAD --hard'

## cc to replace cd for getting to code files
cc() {
	cd ~/*code;
	if [ $# -eq 1 ]
	then
		cd "$1"*
	fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# set up thefk
eval $(thefuck --alias fk)
