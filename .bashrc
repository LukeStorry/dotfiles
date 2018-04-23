HISTCONTROL=ignoreboth
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


alias l='ls --color=tty'
alias ..='cd ..'
alias bc='bc -l'                #calculator has maths stuff by default
alias gogit='git add -A; git commit -a -v -m "another update"; git push origin master'
alias rm='rm -i'

alias c='printf'\n\n\n\n\n\n\n\n==========================================================='; clear'
alias h='history'

alias gc='git commit -am "'
alias gs='git status'
alias gp='git pull --rebase && git push'
alias ga='git add'
alias v='vim -p *'
alias m='c & make'
alias b='m & ./Build/*'

# make shell only give current folder name
# export PS1="/\W > "


# git integration
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="verbose, name"
export PS1="\[\033[1;36m\]-//\W$(__git_ps1 " (%s)")\$\[\033[0m\] "

