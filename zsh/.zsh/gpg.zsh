if [ -z "$(pgrep gpg-agent)" ]; then
  # The GPG agent is not running, so start it
  eval $(gpg-agent --daemon)
  GPG_TTY=$(tty)
  export GPG_TTY
fi

# Check and load GPG agent info if available
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

# Use this function if gpg-agent is misbehaving
gpgrestart () {
  echo "Killing gpg-agent"
  code=0
  while [ 1 -ne $code ]; do
    killall gpg-agent
    code=$?
    sleep 1
  done

  echo "Killing ssh"
  killall ssh

  echo "Killing ssh muxers"
  for pid in $(ps -ef | grep ssh | grep -v grep | awk '{print $2}'); do
    kill $pid
  done

  echo "Restarting gpg-agent"
  eval $(gpg-agent --daemon)

  echo
  echo "All done. Now unplug/replug the NEO token."
}
