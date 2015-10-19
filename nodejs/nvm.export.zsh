# add nvm dir
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# reinstall global packages (needed when switching with nvm)
alias nodeify="nvm reinstall-packages"
