# simplify common git stuff
alias ga='git add -A && git commit -am "'
alias ga='git commit --amend --no-edit'
alias gam='git commit --amend -m "'
alias gogit='git add -A; git commit -am "another update"; git push origin master'

alias gs='git status'
alias gp='git pull --rebase && git push'
alias ga='git add -A'

# easy screen clearing
alias c='clear'

## Colorize the ls output ##
alias ls='ls --color=auto'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

## Colorize the grep command output
alias grep='grep --color=auto'

# add time command
alias now='date +"%T"'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root' # confirmation #
alias mv='mv -i'
alias cp='cp -i'


# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'


# unzip tar packages easily
alias untar='tar -zxvf '
