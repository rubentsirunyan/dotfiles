#!/usr/bin/env bash
# Re-sort Chrome and Obsidian windows onto their designated workspaces.
#
# aerospace's on-window-detected fires once per window, and Chrome/Obsidian
# set their final window titles after the window appears, so the title-based
# rules in aerospace.toml can lose that race at login. This script re-reads
# titles after the fact and moves misplaced windows. Keep the rules in
# target_for in sync with the [[on-window-detected]] rules in aerospace.toml.
#
# Usage:
#   sort-windows.sh             one pass over current windows
#   sort-windows.sh --watch 90  keep correcting for 90 seconds (login)

set -u
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

watch_secs=0
[[ "${1:-}" == "--watch" ]] && watch_secs="${2:-90}"

log() { printf '%s %s\n' "$(date '+%F %T')" "$*" >>/tmp/aerospace-sort-windows.log; }

# Echo the target workspace for a window, or nothing while the title is
# still a placeholder that can't be classified yet.
chrome_work_re='Google Chrome - .* .Work.$'
target_for() {
  local app=$1 title=$2
  case $app in
    com.google.Chrome)
      if [[ $title =~ $chrome_work_re ]]; then echo 2
      elif [[ $title == *'Google Chrome'* ]]; then echo 3
      fi ;;
    md.obsidian)
      if [[ $title == *' - work - Obsidian'* ]]; then echo 4
      elif [[ $title == *' - Main - Obsidian'* ]]; then echo 7
      fi ;;
  esac
}

sort_once() {
  local id app ws title target
  while IFS='|' read -r id app ws title; do
    target=$(target_for "$app" "$title")
    [[ -z $target || $ws == "$target" ]] && continue
    if aerospace move-node-to-workspace --window-id "$id" "$target"; then
      log "moved $app window $id '$title': $ws -> $target"
    else
      log "failed to move $app window $id '$title': $ws -> $target"
    fi
  done < <(aerospace list-windows --all \
             --format '%{window-id}|%{app-bundle-id}|%{workspace}|%{window-title}')
}

log "start (watch=${watch_secs}s)"
sort_once
deadline=$(( $(date +%s) + watch_secs ))
while (( $(date +%s) < deadline )); do
  sleep 3
  sort_once
done
