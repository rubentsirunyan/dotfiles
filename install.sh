#!/bin/bash



sudo apt install -y terminator
sudo apt install -y vim-gtk
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-zsh --no-fish

cp -r .vim* ~/
cp -r terminator ~/.config/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

if ! [ -f /etc/bashrc ]; then
  sudo cp /etc/skel/.bashrc /etc/bashrc
fi
cp .bashrc ~/.bashrc
