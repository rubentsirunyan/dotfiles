# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export XDG_CONFIG_HOME="$HOME/.config" # Added for lazygit https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md

# Goku config file location. This actually doesn't work because seems like brew (and launchd in general) services ignore env vars set here, so this env var is also duplicated in the launchd plist of goku at `$HOME/Library/LaunchAgents/homebrew.mxcl.goku.plist` like this
#     <key>GOKU_EDN_CONFIG_FILE</key>
#     <string>/Users/ruben.tsirunyan/.config/goku/karabiner.edn</string>
export GOKU_EDN_CONFIG_FILE="$XDG_CONFIG_HOME/goku/karabiner.edn"

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
zsh_plugins_list=${XDG_CONFIG_HOME}/zsh/plugins.list
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins_list} ]]; then
  (
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins_list} >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# zsh autoasuggestions color
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

source ${XDG_CONFIG_HOME}/zsh/fzf.zsh
source ${XDG_CONFIG_HOME}/zsh/git_fzf.zsh
source ${XDG_CONFIG_HOME}/zsh/bw_fzf.zsh
# source ${XDG_CONFIG_HOME}/zsh/gpg.zsh
source ${XDG_CONFIG_HOME}/zsh/aliases.zsh

# source ~/.zsh/work.zsh

export FZF_BASE=/usr/local/opt/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide init
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/starship-colors.omp.toml)"

export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Customize p10k.
# [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ruben.tsirunyan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/ruben.tsirunyan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
