
alias brc='notepad ~/.bashrc'
alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'
alias ri='rider.cmd'
alias ide='idea.cmd'
alias sp='start chrome --app="https://play.spotify.com" --window-position=0,0 --window-size=800,50'
alias e='explorer'

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
alias gl='git log --pretty=format:"%C(yellow)%h %C(cyan)%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=format:"%Y-%m-%d %H:%M"'
alias glg='gl --date=relative --graph'
alias gs='git status'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gcl='git clean -n -d -x'
alias gcli='git clean -i -d -x'
alias gclf='git clean -f -d -x'
alias gam='git commit --amend -m "'
alias gres='git reset HEAD --mixed'
alias gresh='git reset HEAD --hard'

# cc to replace cd for getting to code files
cc() {
	cd ~;
	if [ $# -eq 1 ]
	then
		cd "$1"*
	fi
}

# jump into directories if you know where you're going
cdd() {
	cd "$1"*/"$2"*/$3*
}


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# set up thefk
export PYTHONIOENCODING="utf-8"
eval $(thefuck --alias fk)
