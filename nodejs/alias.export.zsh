alias npmi="npm install --save-exact true"
alias npmg="npm install -g "

function npmii() {
  echo "installing $@, from public npm-registry"
  local TMP="$HOME/.npmrc.temp";
  local PRM="$HOME/.npmrc"
  mv $PRM $TMP
  npm install --force true "$@"
  mv $TMP $PRM
}


function npmgg(){
  npmii "-g" "$@"
}
