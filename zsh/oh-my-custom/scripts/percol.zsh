# percol
function percol-src() {
  local selected_dir=$(ghq list --full-path | percol --query "$lbuffer")
  if [ -n "$selected_dir" ]; then
    buffer="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
 zle -N percol-src
 bindkey '^s' percol-src

function exists { which $1 &> /dev/null }
function percol_select_history() {
  local tac
  exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
  buffer=$(fc -l -n 1 | eval $tac | percol --query "$lbuffer")
  cursor=$#buffer         # move cursor
  zle -r -c               # refresh
}

 zle -N percol_select_history
 bindkey '^r' percol_select_history

