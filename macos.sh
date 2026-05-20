#!/usr/bin/env bash
# macOS preferences. Run with: ./macos.sh
# Some settings take effect only after logout/login.

set -euo pipefail

# Dock on the left side of the screen.
defaults write com.apple.dock orientation -string "left"

# Requires dockutil (brew install dockutil).
dockutil --remove all --no-restart
dockutil --add /Applications/Ghostty.app             --no-restart
dockutil --add "/Applications/Google Chrome.app"     --no-restart
dockutil --add /System/Applications/Mail.app         --no-restart
dockutil --add /System/Applications/Calendar.app     --no-restart
dockutil --add /Applications/Obsidian.app            --no-restart
dockutil --add /Applications/TickTick.app            --no-restart
dockutil --add /Applications/Spotify.app             --no-restart

# Keyboard repeat — very fast.
# Needs logout/login to apply.
defaults write -g KeyRepeat -int 1          # delay between repeats
defaults write -g InitialKeyRepeat -int 10  # delay before repeating starts

# Don't hide windows when clicking the wallpaper (macOS Sonoma+ behavior).
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
killall WindowManager 2>/dev/null || true

# Per-machine additions — extra dock apps, work-only defaults, etc.
# Lives next to this script but is gitignored. See macos.local.sh.example.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ -f "$script_dir/macos.local.sh" ] && . "$script_dir/macos.local.sh"

killall Dock

echo "Done. Log out and back in for keyboard repeat to take effect."
