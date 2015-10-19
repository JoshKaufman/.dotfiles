apptravel () {
  app="$1"
  sketchcmd="\"date 0101010114; open -a '$app'; ntpdate -u time.apple.com\""
  sudo zsh -c '"'${(z)sketchcmd}'"'
}

sketchtravel () {
  apptravel "$HOME/downloads/Sketch.app"
}

alias sketch=sketchtravel
