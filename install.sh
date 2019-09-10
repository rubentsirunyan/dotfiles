#!/bin/bash

sudo apt install -y terminator
sudo apt install -y vim-gtk
sudo apt install -y silversearcher-ag
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-zsh --no-fish

# Install the themes
sudo add-apt-repository -y ppa:ryu0/aesthetics
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:tista/adapta
sudo apt update
sudo apt install -y matcha-theme adapta-gtk-theme papirus-icon-theme papirus-folders

# Change folder colors
#papirus-folders -C teal --theme Papirus-Dark

# Docky
sudo apt install -y docky

stow bash
stow terminator
stow vim
stow git

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

if ! [ -f /etc/bashrc ]; then
  sudo cp /etc/skel/.bashrc /etc/bashrc
fi

sudo cp root.bashrc /root/.bashrc
