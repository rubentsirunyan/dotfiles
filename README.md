# My dotfiles

---

## MacOS

1. Clone this repo:

   ```shell
   git clone git@github.com:rubentsirunyan/dotfiles.git ~/.dotfiles
   ```

2. Install Homebrew and the brew packages:
   - Install Homebrew
    ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

   - Use [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to install the stuff listed in the `.Brewfile`:
   ```shell
   brew bundle --file=~/.dotfiles/homebrew/.Brewfile
   ```

   After the `.Brewfile` is symlinked into `~/.Brewfile`, just use:

   ```shell
   brew bundle --global
   ```

3. Install Iterm2

4. Install Oh My ZSH
   ```shell
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

5. Install the fonts required by Powerlevel10k
   ```shell
   curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output '/Users/$USER/Library/Fonts/MesloLGS NF Regular.ttf'
   curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output '/Users/$USER/Library/Fonts/MesloLGS NF Bold.ttf'
   curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output '/Users/$USER/Library/Fonts/MesloLGS NF Italic.ttf'
   curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output '/Users/$USER/Library/Fonts/MesloLGS NF Bold Italic.ttf'
   ```

6. Configure Iterm2 to load the preferences
   - Open Iterm2 preferences
   - Go to general -> preferences
   - Load `~/dotfiles/iterm2` directory

7. Use `stow` to symlink whatever config files are relevant:

   ```shell
   # Delete the default .zshrc
   rm ~/.zshrc
   cd ~/.dotfiles/
   stow zsh
   stow vim
   stow nvim
   stow git
   ```
