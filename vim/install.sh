#!/bin/sh
#
# Vim
# This installs vim and vim plugins (using vundle)


# check for vim
if ! type "vim" &> /dev/null;
then
  echo " Installing Vim for you."

  # install vim
  brew install vim

  # install vundle/vundlePlugins
  $DOTZ/vim/vundle-install.sh 2>&1

  # create temp files used by vim
  mkdir -p $HOME/.vim/tmp/{backup,swap,tags,undo}

fi

exit 0
