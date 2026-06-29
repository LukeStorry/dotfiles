# AGENTS

Instructions for AI coding agents working in this repository.

## Project Scope

This repository contains personal shell and tooling dotfiles, not an application service.

Start with:

- [README.md](README.md) for machine setup and verification
- [.zshrc](.zshrc) for active zsh behavior, aliases, and functions
- [Brewfile](Brewfile) for package and VS Code extension inventory
- [.gitconfig](.gitconfig) for git-spice aliases and git defaults

## High-Value Rules

1. Treat this as a minimal-risk config repo.
2. Do not regenerate or replace [zfunc/\_git-spice](zfunc/_git-spice). It is intentionally hand-tuned.
3. Never introduce secrets into tracked files. Machine-local secrets belong in ~/.zshrc.local only.
4. Preserve the plugin ordering constraints in [.zshrc](.zshrc):
   - fast-syntax-highlighting loads before zsh-autocomplete
   - zsh-autocomplete loads before compdef-based completion wiring
5. Keep paths HOME-relative unless there is a strong reason not to. Existing setup assumes macOS + Homebrew paths.

## Editing Conventions

1. Prefer focused edits over large rewrites.
2. Keep comments concise and only where behavior is non-obvious.
3. Maintain existing alias and function naming unless asked to refactor.
4. Use zsh-compatible syntax for [.zshrc](.zshrc); avoid Bash-only constructs.

## Validation

After modifying shell config:

1. Syntax-check changed shell files (for example: zsh -n .zshrc and bash -n .bashrc when relevant).
2. Use the verification flow from [README.md](README.md) under Reload and verify.
3. If completions are touched, ensure compaudit remains clean (see README guidance).

## Change Boundaries

Prefer to update only chat customization files unless explicitly asked to change runtime config.
