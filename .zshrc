# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
alias szrc='source ~/.zshrc'
alias zrc='code ~/.zshrc'

alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'
alias gs='git status'
alias gps='git stash; git pull origin main; git stash pop'
alias gc-='git checkout -'
alias gp='git pull'
alias gpom='git checkout main; gp; gc-; git merge main '
alias gpn='git push --no-verify'
alias gpf='git push --force-with-lease'
alias gresh='git reset --hard'
alias gcl='git clean -n -d -x'
alias gcli='git clean -i -d -x'
alias gclf='git clean -f -d -x'
alias gll='git log --pretty=format:"- %s" --reverse -n20'
alias gdelb='git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ds='doppler setup'
alias dsd='doppler setup -c dev --no-interactive'
alias dss='doppler setup -c staging --no-interactive'
alias dsp='doppler setup -c prod --no-interactive'
alias dr='doppler run --preserve-env -- yarn dev'
alias eenv='export $(cat .env | grep "^[^#;]" | xargs)'
alias yy='nvm use && git pull && yarn && dr'

alias td='todoist'
alias tda='todoist q "#LDT today'
alias tdl='todoist sync; todoist list --filter "#LDT" --priority'
alias tdla='tdl --filter "due before: tomorrow" --priority'
alias tdlp='tdl --filter "p1"'


stu() {
  td s; 
  echo ":city_sunset: Yesterday:";
  td cl -f "yesterday & #LDT" | sed -En "s/.*#LDT / - /p";
  echo
  echo ":sunrise: Today:";
  td l -f "today & #LDT" | sed -En "s/.*#LDT[\w ]+  / - /p";
}


co() {
  code ~/code/$1*
}

gc() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [[ "$BRANCH" == "main" ]]; then
    echo 'On main, not committing!'
    return
  fi
  git add -A &&\
  echo 'Committing & pushing...'
  git commit -nam $1 &&\
  git push --no-verify &&\
}
gpr() {
  git add -A &&\
  git stash save $1 &&\
  git checkout main &&\
  git pull &&\
  git checkout -b $1 &&\
  git stash apply &&\
  gc "$(echo $1 | tr "-" " ")" &&\
  gh pr create -w &&\
}

export VISUAL=open\ -n\ -b\ "com.microsoft.VSCode"
export EDITOR="code -w"
export REACT_EDITOR=code

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
if [ -f ".nvmrc" ]; then
  nvm use >/dev/null
fi

source /opt/homebrew/share/zsh/site-functions/_todoist_peco
source ~/code/misc/todoist_functions.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval $(thefuck --alias fk)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

complete -C '/opt/homebrew/bin/aws_completer' aws

###-begin-gt-completions-###
_gt_yargs_completions() {
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT - 1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /Users/lukestorry/.yarn/bin/gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
