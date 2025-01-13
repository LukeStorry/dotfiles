# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
export PATH="/opt/homebrew/bin:$PATH"

. "$HOME/.cargo/env"

alias szrc='source ~/.zshrc'
alias zrc='code ~/.zshrc'

alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'

alias rembranches="git branch | grep -v 'main' | xargs git branch -D"
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
alias gls='glab stack'
alias gp='git pull'
alias gcm='git checkout main; git pull'
alias gpom='git stash; gcm; git stash pop'
alias gmm='gcm; gc-; git merge main'
alias grm='gcm; gc-; git rebase main'
alias gcma='git stash; gcm; git stash pop'
alias gpn='git push --no-verify'
alias gpf='git push --force-with-lease'
alias gpff='git push --force'
alias gresh='git reset --hard'
alias gcl='git clean -n -d -x'
alias gcli='git clean -i -d -x'
alias gclf='git clean -f -d -x'
alias gpc='glab mr checkout'
alias gv='glab mr view -w'
alias gr='glab repo view -w'
alias gmr='glab mr create -fw'
alias nrs='rm -rf node_modules && rm -rf pnpm-lock.yaml && pnpm install'
alias npc='rm -rf pnpm-lock.yaml node_modules; pnpm install'
alias tyc='npx tsc --noEmit'
alias p='pnpm'
alias ch='pnpm changeset; git commit -nam add-changeset && git push'

eval $(thefuck --alias f)
alias fk='f -y'
eval "$(starship init zsh)"

prune() {
  git fetch -p
  for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
    git branch -D $branch
  done
}

pruneall() {
  git fetch -p
  for branch in $(git branch -vv | grep -v '\[origin/' | awk '{print $1}'); do
    git branch -D $branch
  done
}

function co() {
  root_paths=(~/Developer ~/Developer/misc)

  for root_path in "${root_paths[@]}"; do
    target_directory=$(find "$root_path" -maxdepth 1 -type d -iname "$1*" -print -quit)
    [ -n "$target_directory" ] && break
  done

  for root_path in "${root_paths[@]}"; do
    [ -n "$target_directory" ] && break
    target_directory=$(find "$root_path" -maxdepth 2 -type d -iname "*$1*" -print -quit)
  done

  [ -n "$target_directory" ] &&
    echo "Opening directory: $target_directory" &&
    code "$target_directory" &&
    return

  echo "No matching directory found."
}

gc() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [[ $branch == "main" ]] && [[ $2 != "gomain" ]]; then
    echo 'On main, not committing!'
    return
  fi
  git add -A &&
    echo 'Committing & pushing...'
  git commit -nam $1 &&
    git push
}

gtb() {
  git checkout -b "$(echo $1 | tr " " - | tr A-Z a-z | tr / - | tr : -)" &&
    gc $1 &&
    glab mr create -fw
}

gpr() {
  git add -A &&
    git stash save $1 &&
    git checkout main &&
    git pull &&
    git checkout -b "$(echo $1 | tr " " - | tr A-Z a-z | tr / - | tr : -)" &&
    git stash apply &&
    gc $1 &&
    glab mr create -fw
}

export EDITOR="cursor -w"
export REACT_EDITOR=cursor

source /opt/homebrew/opt/nvm/nvm.sh
autoload -U compinit
compinit
source <(glab completion -s zsh)

# Add misc scripts to path
export PATH="$PATH:$HOME/Developer/misc/bin"

# Add poetry to path
export PATH="$HOME/.local/bin:$PATH"
# Make poetry do venvs properly
poetry config virtualenvs.in-project true

# pnpm
export PNPM_HOME="/Users/lukestorry/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
