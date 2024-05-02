# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config" # Added for lazygit https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
export GOKU_EDN_CONFIG_FILE="$XDG_CONFIG_HOME/goku/karabiner.edn" # Goku config file location. This actually doesn't work because seems like brew (and launchd in general) services ignore env vars set here. So the goku config file is at its default location at $XDG_CONFIG_HOME/.config/karabiner.edn

export ZSH_DISABLE_COMPFIX=true
export EDITOR=nvim

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

# Lazy-load antidote and generate the static load file only when needed
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# zsh autoasuggestions color
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

source ~/.zsh/fzf.zsh
source ~/.zsh/git_fzf.zsh
source ~/.zsh/bw_fzf.zsh
source ~/.zsh/gpg.zsh

source ~/.zsh/aliases.zsh


export FZF_BASE=/usr/local/opt/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide init
eval "$(zoxide init zsh)"


export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Customize p10k.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
