#!/bin/bash
#
# Nodejs
# This installs nodejs/npm/nvm and few global npm packages
ifneeded () {

  if test ! $(which "$1")
  then
    npm install -g "$1"
  fi
}

installGlobals () {
  ifneeded "nodemon"
  ifneeded "gulp"
  ifneeded "babel"
  ifneeded "yo"
  ifneeded "bower"
  ifneeded "node-debug"
  ifneeded "nws"
  ifneeded "webpack"
  ifneeded "browserify"
  ifneeded "swagger"
  ifneeded "forever"
  ifneeded "esdoc"
  ifneeded "eslint"

  if ! $(which grunt)
  then
    npm install -g grunt-cli
  fi

}
if test ! $(which node)
then
  # we need a base version of npm so we can install nvm and latest node/iojs
  if ! [ -d $HOME/.nvm ]
  then
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
    . $HOME/.nvm/nvm.sh
    nvm install stable
  fi

  # npm install -g nvm
  installGlobals

fi


exit 0
