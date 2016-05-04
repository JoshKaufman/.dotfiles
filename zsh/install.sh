#!/bin/sh
#
# zsh / install oh-my-zsh
#

set -e

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ];
then
  echo "  Installing zsh for you."
  brew install zsh > /tmp/zsh-build-install.log
fi
unset CHECK_ZSH_INSTALLED

if [ -z "$ZSH" ];
then
  ZSH="$HOME/.oh-my-zsh"
fi

#if [ -d "$ZSH" ]; then
#  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove $ZSH if you want to install"
#  exit
#fi
if [ ! -d "$ZSH" ];
then
  echo "\033[0;34mcloning oh my zsh...\033[0m"
  hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
    echo "git not installed"
    exit
  }
fi


TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ];
then
  echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
else
  echo '============================================='
  echo '\nzsh is already in use. nothing left to do.\n'
  echo '============================================='
fi

exit 0

