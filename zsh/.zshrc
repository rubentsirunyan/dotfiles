# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_DISABLE_COMPFIX=true

# History
export HISTSIZE=50000             #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history    #Where to save history to disk
export SAVEHIST=50000             #Number of history entries to save to disk
#HISTDUP=erase                    #Erase duplicates in the history file
setopt    appendhistory           #Append history to the history file (no overwriting)
#unsetopt share_history           # Do not share history across terminals
setopt    sharehistory            #Share history across terminals
setopt    incappendhistory        #Immediately append to the history file, not just when a term is killed

# Path to your oh-my-zsh installation.
export ZSH="/Users/ruben_tsirunyan/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aws
  brew
  docker
  git
  fzf
  kubectl
  mvn
  pip
  pipenv
  pyenv
  terraform
  vagrant
  virtualenv
  # vi-mode
  zsh-interactive-cd
)

export FZF_BASE=/usr/local/opt/fzf
# export FZF_DEFAULT_COMMAND=fzf

if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  # alias python="$(pyenv which python3)"
  # alias pip="$(pyenv which pip3)"
fi

eval $(thefuck --alias)

source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
source ~/.zsh/fzf.zsh
source ~/.zsh/git_fzf.zsh
source ~/.zsh/bw_fzf.zsh

source ~/.zsh/aliases.zsh

# POWERLEVEL9K_MODE="awesome-fontconfig"
# POWERLEVEL9K_DISABLE_RPROMPT=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
