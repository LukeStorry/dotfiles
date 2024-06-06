alias szrc='source ~/.zshrc'
alias zrc='code ~/.zshrc'

alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'

alias prunebranches="git fetch -p; git branch -vv | grep ': gone]' | xargs git branch -D"
alias gll='git log --pretty=format:"- %s" --reverse -n20'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../../'
alias ds='doppler setup'
alias dsd='doppler setup -c dev --no-interactive'
alias dss='doppler setup -c staging --no-interactive'
alias dsp='doppler setup -c prod --no-interactive'
alias dr='doppler run --preserve-env -- yarn dev'
alias eenv='export $(cat .env | grep "^[^#;]" | xargs)'
alias yy='nvm use && git pull && yarn && dr'
alias y='nvm use && dr'
alias prs="gh api -X GET search/issues -f q='author:lukestorry' | jq -r '\" - \" + (.items | .[] | .title)'"
alias prsu="gh api -X GET search/issues -f q='author:@me' | jq -r '\" - \" + (.items | reverse | .[] | [.title,.html_url] | join(\" - \") )'"

alias td='todoist'
alias tda='todoist q "#LDT today'
alias tdl='todoist sync; todoist list --filter "#LDT" --priority'
alias tdla='tdl --filter "due before: tomorrow" --priority'
alias tdlp='tdl --filter "p1"'

alias gs='git status'
alias gc-='git checkout -'
alias gp='git pull'
alias gpom='git stash; git checkout main; gp; git stash pop'
alias gtma='git stash; git checkout main; git pull; git stash pop; gta'
alias gpn='git push --no-verify'
alias gpf='git push --force-with-lease'
alias gresh='git reset --hard'
alias gcl='git clean -n -d -x'
alias gcli='git clean -i -d -x'
alias gclf='git clean -f -d -x'
alias gts='gt restack; gt submit -f'
alias gta='gt create --ai'
alias gtaa='gt create --ai -a; gt submit --ai'
alias gpc='gh pr checkout'
alias gv='gh pr view -w '
alias gtu='brew update && brew upgrade withgraphite/tap/graphite-beta'
alias gtt='gt trunk; gt sync --no-interactive -f; gt submit --stack --ai -f'

# WTH is overwriting these?!?
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export NODE_ENV=

stu() {
  td s; 
  echo ":arrow_left: Past:";
  td cl -f "today & #LDT" | sed -En "s/.*#LDT / - /p";
  echo
  echo ":arrow_right: Future:";
  td l -f "(today | tomorrow) & #LDT" | sed -En "s/.*  / - /p";
}

# gh api -X GET search/issues -f q='author:@me page:0' | jq -r '.items | .[] | .created_at+","+.title+","+.url' >> prs.csv;

function co() {
  root_paths=(~/code ~/code/backend/services ~/code/misc ~/code/shared/packages)

  for root_path in "${root_paths[@]}"; do
    target_directory=$(find "$root_path" -maxdepth 1 -type d -iname "$1*" -print -quit)
    [ -n "$target_directory" ] && break
  done

  for root_path in "${root_paths[@]}"; do
    [ -n "$target_directory" ] && break
    target_directory=$(find "$root_path" -maxdepth 2 -type d -iname "*$1*" -print -quit)
  done

  [ -n "$target_directory" ] &&\
      echo "Opening directory: $target_directory" &&\
      code "$target_directory" &&\
      return

  echo "No matching directory found."
}

gc() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [[ $branch == "main" ]] && [[ $2 != "gomain" ]]; then
    echo 'On main, not committing!'
    return
  fi
  git add -A &&\
  echo 'Committing & pushing...'
  git commit -nam $1 &&\
  git push &&\
}

gtb () {
  gt create -m $1 &&\
  gt ss -r ;
}

# gpr() {
#   git add -A &&\
#   git stash save $1 &&\
#   git checkout main &&\
#   git pull &&\
#   git checkout -b "$(echo $1 | tr " " - | tr A-Z a-z | tr / - | tr : -)" &&\
#   git stash apply &&\
#   gc $1 &&\
#   gh pr create -w &&\
# }

export VISUAL=open\ -n\ -b\ "com.microsoft.VSCode"
export EDITOR="code -w"
export REACT_EDITOR=code

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
if [ -f ".nvmrc" ]; then
  nvm use >/dev/null
fi

# eval "$(github-copilot-cli alias -- "$0")"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval $(thefuck --alias fk)

# Add misc scripts to path
export PATH="$PATH:$HOME/code/misc/bin"

complete -C '/opt/homebrew/bin/aws_completer' aws

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# bun completions
[ -s "/Users/lukestorry/.bun/_bun" ] && source "/Users/lukestorry/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
