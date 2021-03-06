#!/bin/bash

sudo apt-get update
sudo apt-get install -y terminator vim-gtk silversearcher-ag autojump xclip stow

# Python, PIP
sudo apt-get install python-pip python3-pip python-dev

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-zsh --no-fish

# Install the themes
sudo add-apt-repository -y ppa:ryu0/aesthetics
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:tista/adapta
sudo apt-get update
sudo apt-get install -y matcha-theme adapta-gtk-theme papirus-icon-theme papirus-folders

# Change folder colors
#papirus-folders -C teal --theme Papirus-Dark

# Docky
sudo apt-get install -y docky

# Powerline
pip3 install --user powerline-status
sudo apt-get install -y fonts-powerline

sudo apt-get install -y cmake build-essential python3-dev mono-complete

# Golang
cd /tmp
wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
sudo tar -xvf go1.14.linux-amd64.tar.gz
sudo mv go /usr/local
export PATH=$PATH:/usr/local/go/bin

# Node, NPM
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# My scripts
git clone https://github.com/rubentsirunyan/terminal-project-title.git /opt/terminal-project-title && chmod +x /opt/terminal-project-title/find_project_root
git clone https://github.com/rubentsirunyan/jr.git /opt/jr && chmod +x /opt/jr/jr

rm ~/.bashrc ~/.profile

cd "$(dirname "$0")"
stow bash
stow terminator
stow vim
stow nvim
stow git
sudo cp root.bashrc /root/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

# Nvim
cd /tmp && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo mv nvim.appimage /usr/local/share/
sudo chmod +x /usr/local/share/nvim.appimage
sudo ln -s /usr/local/share/nvim.appimage /usr/local/bin/nvim


if ! [ -f /etc/bashrc ]; then
  sudo cp /etc/skel/.bashrc /etc/bashrc
fi

xfconf-query -c xfwm4 -p /general/theme -s Matcha-dark-sea
xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Light
xfconf-query -c xfce4-panel -p /panels/panel-0/autohide-behavior -s 1
xfconf-query -c xfce4-panel -p /panels/panel-0/position-locked -s true

# Armenian alt. phonetic
# Keyboard layout widget in the top panel
# cursor speed
# Window switching (winows manager tweaks)



# docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


# Ansible, Molecule

pip3 install --user ansible
pip3 install --user docker
pip3 install --user molecule
pip3 install --user molecule[docker]
