# install required packages
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# FIXME: Add brew to the path

# fonts
cd ~/Library/Fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output 'MesloLGS NF Regular.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output 'MesloLGS NF Bold.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output 'MesloLGS NF Italic.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output 'MesloLGS NF Bold Italic.ttf'
cd ~/dotfiles

# kitty
kitty & # Open kitty to create the config folder
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
stow kitty

# zsh
sudo apt install -y zsh
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
stow zsh
chsh -s $(which zsh)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# tmux
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
stow asdf
cut -d' ' -f1 ~/.tool-versions | xargs -I {} asdf plugin add {}
asdf install

# nvim
sudo snap install nvim --classic # apt neovim is very old, so it needs to be installed via snap
stow nvim
