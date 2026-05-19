# My dotfiles

## macOS setup

1. Clone the repo:

   ```shell
   git clone https://github.com/rubentsirunyan/dotfiles.git ~/dotfiles
   ```

2. Install Homebrew and packages:

   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew bundle install --file=~/dotfiles/Brewfile
   ```

3. Symlink configs with stow:

   ```shell
   mkdir -p ~/.config
   cd ~/dotfiles && stow .
   ```

   The `mkdir` matters: if `~/.config` doesn't exist, stow folds the
   entire `.config` directory into a single top-level symlink, and any
   app writing to `~/.config/<anything>` ends up writing inside this
   repo. Pre-creating `~/.config` forces stow to fold one level deeper
   (per-tool), limiting that blast radius to apps you actually manage.

4. Install tool versions:

   ```shell
   cd ~ && mise install
   ```

5. Per-machine git identity: copy the template and fill in your email.

   ```shell
   cp ~/dotfiles/.gitconfig.local.example ~/.gitconfig.local
   $EDITOR ~/.gitconfig.local
   ```

   `~/.gitconfig` (stowed) auto-includes `~/.gitconfig.local`. Use the
   commented `includeIf` blocks in the template to switch identity per
   client directory.

6. Apply macOS preferences (dock position, keyboard repeat rate, etc.):

   ```shell
   ~/dotfiles/macos.sh
   ```

   Log out and back in for keyboard-repeat changes to take effect.
   Optional: copy `macos.local.sh.example` to `macos.local.sh` to add
   private dock apps or work-only defaults — `macos.sh` sources it
   automatically when present.

7. Install tmux plugins: open tmux and hit `<prefix> + I`.

8. Karabiner:
   - Open Karabiner Elements, grant permissions, and create a profile called `Default`.
   - Start Goku (reads `~/.config/karabiner.edn` by default, which `stow` already linked):

     ```shell
     brew services start yqrashawn/goku/goku
     ```
