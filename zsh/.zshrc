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

source ~/.config/zsh/antigen.zsh

antigen theme romkatv/powerlevel10k

antigen bundle Aloxaf/fzf-tab
antigen bundle aws
antigen bundle asdf
antigen bundle brew
antigen bundle docker
antigen bundle git
antigen bundle fzf
antigen bundle kubectl
antigen bundle mvn
antigen bundle pip
antigen bundle terraform
antigen bundle virtualenv
antigen bundle vi-mode
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-interactive-cd

antigen apply

# https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# zsh autoasuggestions color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

source ~/.zsh/fzf.zsh
source ~/.zsh/git_fzf.zsh
source ~/.zsh/bw_fzf.zsh

source ~/.zsh/aliases.zsh


export FZF_BASE=/usr/local/opt/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Customize p10k.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
