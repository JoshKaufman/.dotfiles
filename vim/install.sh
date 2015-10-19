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

fi

exit 0
