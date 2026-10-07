# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export XDG_CONFIG_HOME="$HOME/.config" # Added for lazygit https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md

export ZSH_DISABLE_COMPFIX=true
export EDITOR=nvim
export HOMEBREW_NO_AUTO_UPDATE="1"

# History
export HISTSIZE=50000             #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history    #Where to save history to disk
export SAVEHIST=50000             #Number of history entries to save to disk
#HISTDUP=erase                    #Erase duplicates in the history file
setopt    appendhistory           #Append history to the history file (no overwriting)
#unsetopt share_history           # Do not share history across terminals
setopt    sharehistory            #Share history across terminals
setopt    incappendhistory        #Immediately append to the history file, not just when a term is killed
setopt    globdots        # Lets files beginning with a . be matched without explicitly specifying the dot.

# Keep path/fpath duplicate-free so re-sourcing this file in a live shell
# (e.g. `source ~/.zshrc` after a config change) doesn't grow them each time.
typeset -U path fpath

# Completion system — must initialize before plugins like fzf-tab that wrap it.
fpath=(/Users/ruben.tsirunyan/.docker/completions $fpath)
autoload -Uz compinit
# -i ignores insecure files instead of asking. Docker Desktop's symlinks in
# /opt/homebrew/share/zsh/site-functions are admin-group-writable, so without
# -i a re-source hangs on compinit's "[y] or abort [n]?" prompt.
compinit -i

# Lazy-load antidote and generate the static load file only when needed
zsh_plugins_list=${XDG_CONFIG_HOME}/zsh/plugins.list
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins_list} ]]; then
  (
    # antidote lives in ~/.antidote (git clone; see ubuntu.sh) or under Homebrew (macOS).
    if [[ -r ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh ]]; then
      source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
    else
      source $(brew --prefix antidote)/share/antidote/antidote.zsh
    fi
    antidote bundle <${zsh_plugins_list} >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

eval "$(mise activate zsh)"

# zsh autoasuggestions color
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

source ${XDG_CONFIG_HOME}/zsh/fzf.zsh
source ${XDG_CONFIG_HOME}/zsh/git_fzf.zsh
# source ${XDG_CONFIG_HOME}/zsh/bw_fzf.zsh
# source ${XDG_CONFIG_HOME}/zsh/xpdiff.zsh
# source ${XDG_CONFIG_HOME}/zsh/gpg.zsh
source ${XDG_CONFIG_HOME}/zsh/aliases.zsh

[[ -f ${XDG_CONFIG_HOME}/zsh/work.local.zsh ]] && source ${XDG_CONFIG_HOME}/zsh/work.local.zsh

eval "$(fzf --zsh)"

# Zoxide init
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# export STARSHIP_CONFIG=/Users/ruben.tsirunyan/dotfiles/starship-omerxx.toml

# eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/starship-colors.omp.toml)"


export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
