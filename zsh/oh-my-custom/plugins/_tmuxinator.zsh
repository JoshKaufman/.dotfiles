#compdef tmuxinator mux

_tmuxinator() {
  local projects commands
  projects=(${(f)"$(tmuxinator completions start)"})
  commands=(${(f)"$(tmuxinator commands zsh)"})

  if (( CURRENT == 2 )); then
    _describe -t projects "tmuxinator projects" projects
    _describe -t commands "tmuxinator subcommands" commands
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
        ;;
    esac
  fi

  return
}

_tmuxinator

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
