# shared-packages.nix
# Packages common to both Ubuntu and macOS
{ pkgs }:
with pkgs;
[
  stow
  gnupg
  postgresql_16
  mkalias
  raycast
  tmux
  neovim
  asdf-vm
  zoxide
  starship
  antidote
  fzf
  fzf-zsh
  terminal-notifier
  nmap
  mtr
  htop
  watch
  tree
  wget
  aerospace
]
