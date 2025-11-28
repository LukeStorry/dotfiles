# ============================================================================
# PATH Configuration (early, before other tools)
# ============================================================================
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/Developer/misc/bin"

# pnpm
export PNPM_HOME="/Users/lukestorry/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# Environment Variables
# ============================================================================
export EDITOR="cursor -w"
export REACT_EDITOR=cursor
export PRISMA_BINARY_TARGETS='["native"]'

# NVM Configuration (set once, loaded lazily)
export NVM_DIR="$HOME/.nvm"

# ============================================================================
# Completions (lazy loaded where possible)
# ============================================================================
fpath=(/Users/lukestorry/.docker/completions $fpath)

# ============================================================================
# ZSH Plugins (autocomplete, autosuggestions, syntax highlighting)
# ============================================================================
# Load zsh-autocomplete FIRST (must be before any compdef calls, per README)
# This replaces compinit and provides enhanced autocomplete
if [ -d "$HOME/.zsh/plugins/zsh-autocomplete" ]; then
  source "$HOME/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" 2>/dev/null
fi

# Load fast-syntax-highlighting (must be before prompt)
if [ -d "$HOME/.zsh/plugins/fast-syntax-highlighting" ]; then
  source "$HOME/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 2>/dev/null
fi

# Load zsh-autosuggestions (command suggestions based on history)
if [ -d "$HOME/.zsh/plugins/zsh-autosuggestions" ]; then
  source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" 2>/dev/null
fi

# Load pnpm completion (built-in pnpm commands - after zsh-autocomplete)
if command -v pnpm &> /dev/null; then
  source <(pnpm completion zsh) 2>/dev/null
fi

# Load npm/pnpm scripts autocomplete (works with npm, yarn, bun, and pnpm)
if [ -f "$HOME/.zsh/plugins/zsh-npm-scripts-autocomplete/zsh-npm-scripts-autocomplete.plugin.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-npm-scripts-autocomplete/zsh-npm-scripts-autocomplete.plugin.zsh" 2>/dev/null
  # Optional: Invoke selected script with a single Enter/Return press
  zmodload -i zsh/complist 2>/dev/null
  bindkey -M menuselect '^M' .accept-line 2>/dev/null
fi

# ============================================================================
# NVM 
# ============================================================================
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ============================================================================
# Cargo (conditional - only if cargo exists)
# ============================================================================
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# ============================================================================
# Prompt (starship - keep this as it's needed immediately)
# ============================================================================
eval "$(starship init zsh)"

# ============================================================================
# Lazy Load Slow Tools (deferred initialization)
# ============================================================================

# Lazy load thefuck (only when 'f' is called - saves ~100-200ms on startup)
f() {
  unfunction f
  eval $(thefuck --alias f)
  f "$@"
}

# Glab completion (conditional - only if glab is installed)
if command -v glab &> /dev/null; then
  source <(glab completion -s zsh) 2>/dev/null
fi

# ============================================================================
# Aliases
# ============================================================================
alias szrc='source ~/.zshrc'  # Source zshrc (reload config)
alias zrc='code ~/.zshrc'      # Open zshrc in editor

alias c='clear'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -la'
alias h='history'

alias rembranches="git branch | grep -v 'main' | xargs git branch -D"  # Remove branches (all except main)
alias gll='git log --pretty=format:"- %s" --reverse -n20'  # Git log list (last 20 commits)
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../../'
alias eenv='set -a; source <(cat .env | grep "^[^#;]"); set +a'  # Export env vars from .env file

alias yy='nvm use && git pull && yarn && dr'  # Yarn (use node, pull, yarn install, dev run)
alias y='nvm use && dr'  # Yarn quick (use node, dev run)

alias prs="gh api -X GET search/issues -f q='author:lukestorry' | jq -r '\" - \" + (.items | .[] | .title)'"  # Pull requests (my PRs)
alias prsu="gh api -X GET search/issues -f q='author:@me' | jq -r '\" - \" + (.items | reverse | .[] | [.title,.html_url] | join(\" - \") )'"  # Pull requests user (my PRs with URLs)

alias td='todoist'
alias tda='todoist q "#LDT today'  # Todoist: LDT tasks due today
alias tdl='todoist sync; todoist list --filter "#LDT" --priority'  # Todoist: LDT list with priority
alias tdla='tdl --filter "due before: tomorrow" --priority'  # Todoist: LDT list active (due before tomorrow)
alias tdlp='tdl --filter "p1"'  # Todoist: LDT list priority 1

alias gs='git status'
alias gc-='git checkout -'  # Git checkout previous branch
alias gls='glab stack'  # GitLab stack
alias g='git-branchless'
alias gp='git pull'
alias gcm='git checkout main; git pull'  # Git checkout main
alias gpom='git stash; git checkout main; git pull; git stash pop'  # Git pull on main
alias gpod='git stash; git checkout - && git stash pop'  # Git pull on dev (previous branch)
alias gmm='gcm; gc-; git merge main'  # Git merge main
alias grm='gcm; gc-; git rebase main'  # Git rebase main
alias gcma='git stash; gcm; git stash pop'  # Git checkout main (with stash)
alias gpn='git push --no-verify'  # Git push no-verify (skip hooks)
alias gpf='git push --force-with-lease'  # Git push force (safer)
alias gpff='git push --force'  # Git push force force (dangerous)
alias gresh='git reset --hard'  # Git reset hard
alias gres='git reset --soft main'  # Git reset soft (to main)
alias gcl='git clean -n -d -x'  # Git clean list (dry run)
alias gam='git diff --cached --quiet && git add -A; git commit --amend --no-edit'  # Git amend (add all and amend)
alias gcli='git clean -i -d -x'  # Git clean interactive
alias gclf='git clean -f -d -x'  # Git clean force
alias gpc='glab mr checkout'  # GitLab MR checkout
alias gv='glab mr view -w'  # GitLab MR view (web)
alias gr='glab repo view -w'  # GitLab repo view (web)
alias gmr='glab mr create -fw'  # GitLab MR create (fill and web)
alias nrs='rm -rf node_modules && rm -rf pnpm-lock.yaml && pnpm install'  # Node remove and setup
alias npc='rm -rf pnpm-lock.yaml node_modules; pnpm install'  # Node pnpm clean
alias python='python3'
alias tyc='npx tsc --noEmit'  # TypeScript check (type check only)
alias p='pnpm'
alias pi='pnpm install'
alias pii='pnpm install --ignore-scripts'  # Pnpm install ignore scripts
alias pl='pnpm link --global'
alias d='pnpm install; p dev; p watch'  # Dev (install, dev, watch)
alias dx='pnpm dlx @facultyai/dmx-cli'  # DMX CLI
alias dxi='pnpm dlx @facultyai/dmx-cli install'  # DMX CLI install
alias dxc='pnpm dlx @facultyai/dmx-cli clean'  # DMX CLI clean

alias fk='f -y'  # f yes (auto-confirm)

# ============================================================================
# Functions
# ============================================================================

# Prune: Delete local branches that track remote branches that no longer exist
prune() {
  git fetch -p
  for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
    git branch -D $branch
  done
}

# Prune all: Delete all local branches (use with caution!)
pruneall() {
  git fetch -p
  for branch in $(git branch -vv | awk '{print $1}'); do
    git branch -D $branch
  done
}

# Co (code/open): Find and open a directory in VS Code by name pattern
# Usage: co <pattern> - searches ~/Developer and ~/Developer/misc
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

# Gc (git commit): Commit and push with safety check (prevents commits on main)
# Usage: gc "commit message" [gomain] - use "gomain" as second arg to allow commits on main
gc() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [[ $BRANCH == "main" ]] && [[ $2 != "gomain" ]]; then
    echo 'On main, not committing!'
    return
  fi
  git add -A &&
    echo 'Committing & pushing...'
  git commit -nam $1 &&
    git push
}

# Gtb (git take branch): Create a new DMX branch, add changeset, commit, and create MR
# Usage: gtb "branch-name" [no] - use "no" as second arg to skip changeset
gtb() {
  if ! git checkout -b "dmx/$(echo $1 | tr -c 'a-zA-Z' - | tr A-Z a-z)"; then
    return 1
  fi

  if [[ "$2" != "no" ]] && [[ "$(pwd)" == /Users/lukestorry/Developer/frontier-platform* ]]; then
    cd /Users/lukestorry/Developer/frontier-platform
    changeset "$1"
    cd -
  fi

  gc "dmx/ $1"
  glab mr create -fw
}

# Gpr (git pull request): Stash changes, update from main, then create branch and MR
# Usage: gpr "branch-name" [no] - use "no" as second arg to skip changeset
gpr() {
  git add -A &&
    git stash save $1 &&
    git checkout main &&
    git pull &&
    git stash apply &&
    gtb $1 $2 
}

# ============================================================================
# Optional: Load local overrides (for machine-specific configs)
# ============================================================================
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
