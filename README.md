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

6. Per-machine zsh extras (work-only env vars, kubeconfigs, etc.): copy
   the template and edit.

   ```shell
   cp ~/.config/zsh/work.local.zsh.example ~/.config/zsh/work.local.zsh
   $EDITOR ~/.config/zsh/work.local.zsh
   ```

   `.zshrc` sources `~/.config/zsh/work.local.zsh` automatically when
   present. The file is gitignored so secrets and per-machine paths
   stay local.

7. Apply macOS preferences (dock position, keyboard repeat rate, etc.):

   ```shell
   ~/dotfiles/macos.sh
   ```

   Log out and back in for keyboard-repeat changes to take effect.
   Optional: copy `macos.local.sh.example` to `macos.local.sh` to add
   private dock apps or work-only defaults — `macos.sh` sources it
   automatically when present.

8. Install tmux plugins: open tmux and hit `<prefix> + I`.

9. Karabiner:
   - Open Karabiner Elements, grant permissions, and create a profile called `Default`.
   - Start Goku (reads `~/.config/karabiner.edn` by default, which `stow` already linked):

     ```shell
     brew services start yqrashawn/goku/goku
     ```

## Ubuntu setup

Ubuntu 24.04 or newer — `.tmux.conf` uses `allow-passthrough`, which needs
tmux ≥ 3.3, and 22.04 ships 3.2a.

1. Clone the repo as above.

2. Install the core packages (zsh, git, stow, tmux, fzf, zoxide, a C
   toolchain), mise from its apt repo, and antidote:

   ```shell
   ~/dotfiles/ubuntu.sh
   ```

   This is the apt counterpart of `brew bundle` for the packages the rest of
   the setup depends on; everything else comes from `mise install`. GUI apps
   and the desktop layer (AeroSpace, Karabiner, Raycast) have no Linux
   counterpart here.

3. Make zsh the login shell, then log out and back in:

   ```shell
   chsh -s "$(command -v zsh)"
   ```

4. Follow macOS steps 3–6 and 8 (stow, `mise install`, git identity, zsh
   extras, tmux plugins). Steps 7 and 9 are macOS-only.
