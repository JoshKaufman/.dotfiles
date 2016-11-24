alias reload!='. ~/.zshrc'
alias c='clear'
alias locate="locate -i" # case insensitive

function ls () {
  command ls -F "$@"
}

alias lsc='ls -F '

function vagrantssh() {
  vagrant up && vagrant ssh -c "bash $* && bash"
}

alias d8="~/code/opensource/v8/out/x64.debug/d8"
alias tick-processor="~/code/opensource/v8/tools/mac-tick-processor"

# @TODO redo witi cross platform support (should work on linux & cygwin as well)
#
function locate () {
  local MAXAGE=$(( 24 * 60*60 )) # twenty-four hours, in seconds.
  local NOW="$(date +%s)"
  local DB="/var/db/locate.database"

  if [ ! -e "$DB" ]
  then
    echo "$FUNCNAME: $DB does not exist. Initializing..." > /dev/stderr
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist > /dev/stderr
    echo "$FUNCNAME: Please try again in a few minutes." > /dev/stderr
    return -1 # stop and fail, there's nothing we can do until the database has been created.
  fi

  local DBCREATED="$(eval $(stat -s $DB); echo $st_mtime )"
  local DBAGE="$(( $NOW - $MAXAGE ))"

  if [ $DBAGE -gt $NOW ]
  then
    echo "$FUNCNAME: $DB is more than $(( $MAXAGE / (60*60) )) hours old. Updating..." > /dev/stderr
    sudo launchctl start com.apple.locate > /dev/stderr
    echo "$FUNCNAME: stale results: " > /dev/stderr
  fi

  command locate "$@"
}

