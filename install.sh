#!/bin/bash

sudo apt update
sudo apt install -y terminator vim-gtk silversearcher-ag autojump xclip

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

# My scripts
git clone https://github.com/rubentsirunyan/terminal-project-title.git /opt/terminal-project-title && chmod +x /opt/terminal-project-title/find_project_root
git clone https://github.com/rubentsirunyan/jr.git /opt/jr && chmod +x /opt/jr/jr

rm .bashrc .profile

cd "$(dirname "$0")"
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
xfconf-query -c xfwm4 -p /general/theme -s Matcha-dark-sea
xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Light
xfconf-query -c xfce4-panel -p /panels/panel-0/autohide-behavior -s 1
xfconf-query -c xfce4-panel -p /panels/panel-0/position-locked -s true

# Armenian alt. phonetic
# Keyboard layout widget in the top panel
# cursor speed
# Window switching (winows manager tweaks)



# docker
sudo apt install y \
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

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


# Python, PIP
sudo apt install python-pip python3-pip python-dev


# Ansible, Molecule

pip install --user ansible
pip install --user docker
pip install --user molecule
pip install --user molecule[docker]
