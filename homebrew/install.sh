#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# check for homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # install cask
    if test ! $(which brew-cask) # test -z "$(brew ls --versions brew-cask)"
    then
      brew install caskroom/cask/brew-cask
    fi

  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi
fi

ifneeded () {
  if test ! $(which $1)
  then
    brew install $1
  else
   brew upgrade $1
  fi
}

ifneeded "curl"
ifneeded "Ack"
ifneeded "vim"
ifneeded "tmux"


exit 0
