# Brewfile — install with `brew bundle --file=~/Developer/misc/dotfiles/Brewfile`
# Reflects the current machine (2026-06). Trimmed of dead entries.

# ── Taps ────────────────────────────────────────────────────────────────────
tap "autozimu/formulas"            # unison-fsmonitor
tap "eugenmayer/dockersync"        # unox
tap "telepresenceio/telepresence"  # telepresence-oss
tap "withgraphite/tap"             # graphite

# ── Shell experience ──────────────────────────────────────────────────────────
# Tab-menu autocomplete comes from the zsh-autocomplete plugin (cloned in setup,
# not brew). Directory jumping is zoxide (`z`). No fzf — not used.
brew "starship"   # prompt
brew "zoxide"     # directory jumping (z) + smarter cd
brew "ripgrep"    # rg — fast search
brew "bat"        # cat with syntax highlighting
brew "jq"         # JSON CLI (used by prs/prsu aliases)
brew "thefuck"    # command correction (lazy-loaded as `f`)

# ── Git / VCS ────────────────────────────────────────────────────────────────
brew "gh"                          # GitHub CLI
brew "glab"                        # GitLab CLI
brew "git-spice"                   # stacked branches (gs)
brew "spr"                         # stacked PRs
brew "withgraphite/tap/graphite"   # graphite (gt)

# ── Languages / runtimes ─────────────────────────────────────────────────────
brew "nvm"            # Node version manager (default node activated in zshrc)
brew "pnpm"
brew "yarn"
brew "python@3.10"    # project default (see CLAUDE.md)
brew "rust"
brew "rustup"
brew "ruff"           # Python lint/format
brew "mypy"           # Python type checker
brew "pre-commit"

# ── Cloud / infra / containers ───────────────────────────────────────────────
brew "awscli"
brew "docker"
brew "docker-compose"
brew "helm"
brew "helm-docs"
brew "k9s"
brew "kubernetes-cli"
brew "tilt"
brew "telepresenceio/telepresence/telepresence-oss"
brew "hf"                                       # Hugging Face CLI
brew "postgresql@14"
brew "unison"                                   # file sync
brew "autozimu/formulas/unison-fsmonitor"
brew "eugenmayer/dockersync/unox"
brew "expect"

# ── Casks ────────────────────────────────────────────────────────────────────
cask "1password-cli"
cask "ghostty"
cask "orbstack"
cask "raycast"
cask "postman"
cask "codex"

# ── VS Code extensions ───────────────────────────────────────────────────────
vscode "anthropic.claude-code"
vscode "astro-build.astro-vscode"
vscode "bierner.markdown-preview-github-styles"
vscode "bradlc.vscode-tailwindcss"
vscode "charliermarsh.ruff"
vscode "christian-kohler.npm-intellisense"
vscode "christian-kohler.path-intellisense"
vscode "davidanson.vscode-markdownlint"
vscode "dbaeumer.vscode-eslint"
vscode "deque-systems.vscode-axe-linter"
vscode "eamodio.gitlens"
vscode "ecmel.vscode-html-css"
vscode "editorconfig.editorconfig"
vscode "esbenp.prettier-vscode"
vscode "foxundermoon.shell-format"
vscode "gitlab.gitlab-workflow"
vscode "gruntfuggly.todo-tree"
vscode "iceyer.toml-formatter"
vscode "johnpapa.vscode-peacock"
vscode "mechatroner.rainbow-csv"
vscode "meganrogge.template-string-converter"
vscode "mikestead.dotenv"
vscode "ms-azuretools.vscode-containers"
vscode "ms-azuretools.vscode-docker"
vscode "ms-ossdata.vscode-pgsql"
vscode "ms-python.debugpy"
vscode "ms-python.mypy-type-checker"
vscode "ms-python.python"
vscode "ms-toolsai.jupyter"
vscode "ms-vscode-remote.remote-containers"
vscode "mtxr.sqltools"
vscode "naumovs.color-highlight"
vscode "oderwat.indent-rainbow"
vscode "planbcoding.vscode-react-refactor"
vscode "quicktype.quicktype"
vscode "redhat.vscode-xml"
vscode "redhat.vscode-yaml"
vscode "rvest.vs-code-prettier-eslint"
vscode "sidthesloth.html5-boilerplate"
vscode "simonsiefke.svg-preview"
vscode "streetsidesoftware.code-spell-checker"
vscode "svelte.svelte-vscode"
vscode "swellaby.rust-pack"
vscode "tamasfe.even-better-toml"
vscode "tobermory.es6-string-html"
vscode "vitest.explorer"
vscode "vscode-icons-team.vscode-icons"
vscode "yzhang.markdown-all-in-one"
