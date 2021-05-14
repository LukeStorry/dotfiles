export HOME="/c/Users/luke.storry" 

# workflow stuff
alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'
alias e='explorer'
alias ri='rider.cmd'
alias pyc='pycharm.cmd'
alias np='start notepad++'
alias idea='idea.cmd'
alias brc='code ~/.bashrc'
alias sbrc='source ~/.bashrc'

alias t='cmd //c "tree /A" |less'
alias tf='cmd //c "tree /F /A"|less'

# # bash history settings
# HISTFILE=~/.bash_history
# HISTCONTROL=ignoreboth
# HISTSIZE=1000
# HISTFILESIZE=2000


# useful git shortcuts
alias gl='git log --pretty=format:"%C(yellow)%h %C(cyan)%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=format:"%Y-%m-%d %H:%M"'
alias glg='gl --date=relative --graph'
alias gs='git status'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gcl='git clean -n -d -x'
alias gcli='git clean -i -d -x'
alias gclf='git clean -f -d -x'
alias gc='git commit -am "'
alias ga='git commit --amend --no-edit'
alias gam='git commit --amend -m "'
alias gres='git reset HEAD --mixed'
alias gresh='git reset HEAD --hard'
alias gg='git-gui.exe'

# make escaping directories easy
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias cdw='cd /c/Users/luke.storry/wamapp'

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

# set title of window
function title {
   PS1="\033]0;$1\007\\n$ "
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
