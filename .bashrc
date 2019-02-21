# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Set the default editor to vim.
export EDITOR=vim

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# User specific aliases and functions
alias ll='ls -lah'

# Fzf stuff
if [ -f ~/.fzf.bash ]; then
	. ~/.fzf.bash
fi

alias __fzf_content_search__='grep -r --line-buffered "" * | fzf --height 40%'
rvim() { vim "scp://$1/$2"; }
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--border'

# Key bindings
bind '"\C-f":" \C-e\C-u\C-y\ey\C-u`__fzf_content_search__`\e\C-e\er\e^"'

