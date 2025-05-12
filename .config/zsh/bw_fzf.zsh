function bwunlock() {
  if hash bw 2>/dev/null; then
    if [ -f /tmp/.bwsession ]; then
      export BW_SESSION=$(cat /tmp/.bwsession)
      bw unlock --check >/dev/null || bw unlock --raw > /tmp/.bwsession && export BW_SESSION=$(cat /tmp/.bwsession)
    else
      bw unlock --raw > /tmp/.bwsession && export BW_SESSION=$(cat /tmp/.bwsession)
    fi
  fi
}

function bwc() {
  if hash bw 2>/dev/null; then
    bwunlock && bw sync && bw get item "$(bw list items |
                               jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' |
                               fzf --height 50% "$@" --border |
                               awk '{print $(NF -0)}' |
                               sed 's/\"//g')" |
                               jq '.login.password' |
                               sed 's/\"//g' |
                               pbcopy

  fi
}
