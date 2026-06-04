# dotfiles

A sync of my personalisation files, eg .vimrc and .bashrc (etc)
## What's here

| File | Symlinks to | Purpose |
|------|-------------|---------|
| `.zshrc` | `~/.zshrc` | Main zsh config: PATH, plugins, completions, aliases, functions |
| `.gitconfig` | `~/.gitconfig` | Git identity, aliases, git-spice (`spice`) shortcuts |
| `.bashrc` | `~/.bashrc` | Bash fallback config |
| `git-prompt.sh` | (sourced by `.bashrc` in place) | Bash git prompt helper |
| `starship.toml` | `~/.config/starship.toml` | Starship prompt theme |
| `zfunc/_git-spice` | `~/.zfunc/_git-spice` | Hand-tuned git-spice (`gs`) zsh completion — kept here on purpose, do **not** regenerate |
| `Brewfile` | — | All brew formulae / casks / VS Code extensions |
| `profiles.json` | — | Terminal profiles (reference) |

Zsh plugins are **not** in this repo — they're cloned from upstream during setup (see below).

## Setting up a new Mac

Run these in order. The username on the new machine doesn't matter — everything is `$HOME`-relative.

### 1. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"   # add brew to PATH for this session
```

### 2. Clone this repo

```bash
mkdir -p ~/Developer/misc
git clone <this-repo-url> ~/Developer/misc/dotfiles
cd ~/Developer/misc/dotfiles
```

### 3. Install everything from the Brewfile

```bash
brew bundle --file=~/Developer/misc/dotfiles/Brewfile
```

### 4. Symlink the dotfiles into $HOME

```bash
DOTFILES=~/Developer/misc/dotfiles
ln -sf "$DOTFILES/.zshrc"          ~/.zshrc
ln -sf "$DOTFILES/.gitconfig"      ~/.gitconfig
ln -sf "$DOTFILES/.bashrc"         ~/.bashrc
mkdir -p ~/.config
ln -sf "$DOTFILES/starship.toml"   ~/.config/starship.toml
mkdir -p ~/.zfunc
ln -sf "$DOTFILES/zfunc/_git-spice" ~/.zfunc/_git-spice
```

### 5. Clone the zsh plugins

`.zshrc` sources these by path and silently skips any that aren't present, so they
must be cloned for autocomplete / syntax highlighting to work:

```bash
mkdir -p ~/.zsh/plugins
git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git              ~/.zsh/plugins/zsh-autocomplete
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git               ~/.zsh/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git  ~/.zsh/plugins/fast-syntax-highlighting
git clone --depth=1 https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete.git ~/.zsh/plugins/zsh-npm-scripts-autocomplete
git clone --depth=1 https://github.com/g-plane/pnpm-shell-completion.git               ~/.zsh/plugins/pnpm-shell-completion
```

What each one gives you:

- **zsh-autocomplete** — the live menu that appears when you type / hit `Tab`
- **zsh-autosuggestions** — greyed-out command suggestion from history
- **fast-syntax-highlighting** — colours commands as you type
- **zsh-npm-scripts-autocomplete** — completes `npm`/`pnpm`/`yarn` script names
- **pnpm-shell-completion** — completes pnpm subcommands

(Directory jumping is `zoxide`'s `z`, installed via the Brewfile — no fzf.)

### 6. Node (nvm) + Rust

```bash
nvm install --lts && nvm alias default 'lts/*'   # .zshrc auto-activates the default
rustup-init -y                                   # if not already set up by brew
```

### 7. Machine-local secrets — `~/.zshrc.local`

`.zshrc` sources `~/.zshrc.local` if present. This file holds tokens
(Artifactory, GitLab, Shortcut, 1Password, Figma, etc.) and is **deliberately
not in this repo**. Recreate it by hand from the password manager — never commit it.

### 8. Optional

```bash
# git global ignore (referenced by .gitconfig excludesFile; harmless if absent)
printf ".DS_Store\n" >> ~/.gitignore_global
```

### 9. Reload and verify

```bash
exec zsh
```

Because the plugin/completion loads no longer suppress errors, **a clean new shell
should print nothing**. If something is wrong it will now show up here instead of
failing silently. Then check:

```bash
# zsh-autocomplete: start typing and a menu should appear below the prompt
git che        # → live completion menu

# zoxide
z -             # jump around once you've visited some dirs

# git-spice completion (uses the repo's zfunc/_git-spice)
gs <Tab>        # → git-spice subcommands

# completion hygiene — should list nothing
compaudit
# if it does, fix with:  compaudit | xargs chmod g-w,o-w
```
