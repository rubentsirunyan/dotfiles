#!/usr/bin/env bash
# Ubuntu bootstrap: the apt counterpart of `brew bundle` for the packages the
# rest of this repo depends on (shell, stow, tmux, mise, antidote). Everything
# else — runtimes, CLIs — comes from mise (.config/mise/config.toml).
# Run with: ./ubuntu.sh   (idempotent; safe to re-run)
#
# Needs Ubuntu 24.04+: .tmux.conf uses allow-passthrough (tmux >= 3.3) and
# 22.04 ships 3.2a.

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update

# Core packages. Each maps to a Brewfile entry or to something macOS ships built in.
core_packages=(
  zsh              # macOS ships zsh; Ubuntu doesn't
  git
  curl
  ca-certificates
  stow             # Brewfile: stow — symlinks this repo into ~
  tmux             # Brewfile: tmux
  fzf              # Brewfile: fzf — fzf-tab, tmux-fzf, tmux-fzf-url, t shell out to it
  zoxide           # Brewfile: zoxide — .zshrc runs `zoxide init`
  build-essential  # C toolchain: nvim-treesitter compiles parsers; mise cargo:/go: backends
  python3-venv     # asdf-style mise plugins (e.g. yamllint) build a venv with the system python
)
sudo apt-get install -y "${core_packages[@]}"

# Python build headers — the pinned pythons (3.11.2, 2.7.18) have no
# precompiled (python-build-standalone) binaries, so `mise install python`
# compiles them with python-build; without these it fails the zlib/readline
# checks. List per the pyenv wiki for Ubuntu. postgres (also source-built by
# mise) uses the same readline/zlib/ssl headers.
python_build_deps=(
  libssl-dev
  zlib1g-dev
  libbz2-dev
  libreadline-dev
  libsqlite3-dev
  libncursesw5-dev
  xz-utils
  tk-dev
  libxml2-dev
  libxmlsec1-dev
  libffi-dev
  liblzma-dev
)
sudo apt-get install -y "${python_build_deps[@]}"

# mise — Brewfile: mise. From mise's own apt repo so `apt upgrade` keeps it current.
# Methods per https://mise.jdx.dev/installing-mise.html#apt:
# PPA on Ubuntu 26.04+, extrepo on Debian 11+ / Ubuntu 22.04+.
if ! command -v mise >/dev/null 2>&1; then
  . /etc/os-release
  if [[ ${ID:-} == ubuntu ]] && dpkg --compare-versions "${VERSION_ID:-0}" ge 26.04; then
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:jdxcode/mise
  else
    sudo apt-get install -y extrepo
    sudo extrepo enable mise
  fi
  sudo apt-get update
  sudo apt-get install -y mise
fi

# antidote — Brewfile: antidote. No apt package; the documented install is a
# clone into ~/.antidote, which .zshrc checks before falling back to Homebrew.
antidote_dir=${ZDOTDIR:-$HOME}/.antidote
if [[ ! -d $antidote_dir ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

echo "Done. Next: chsh -s \"\$(command -v zsh)\", then continue with the README (stow, mise install)."
