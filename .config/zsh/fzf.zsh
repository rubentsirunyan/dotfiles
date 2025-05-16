alias __fzf_content_search__='grep -r --line-buffered "" * | fzf --height 40%'

export FZF_CTRL_T_OPTS='--bind "ctrl-e:execute(vim {} < /dev/tty > /dev/tty)" --border --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500" --height 40%'

function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
