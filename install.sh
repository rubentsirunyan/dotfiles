#!/bin/bash

git submodule update --init --recursive

sudo apt install -y terminator
sudo apt install -y vim-gtk
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-zsh --no-fish

cp -r .vim* ~/
cp -r terminator ~/.config/

vim +PluginInstall +qall

if [ ! -f /etc/bashrc ];
  sudo cp /etc/skel/.bashrc /etc/bashrc
fi
cp .bashrc ~/.bashrc
