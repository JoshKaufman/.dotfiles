#!/bin/sh
#
# zsh / partial oh-my-zsh
#

set -e

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  echo "  Installing zsh for you."
  brew install zsh > /tmp/zsh-build-install.log
fi
unset CHECK_ZSH_INSTALLED

#if [ ! -n "$ZSH" ];
#  ZSH=~/.oh-my-zsh
#fi

#if [ -d "$ZSH" ]; then
#  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove $ZSH if you want to install"
#  exit
#fi

#echo "\033[0;34mCloning Oh My Zsh...\033[0m"
#hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
#  echo "git not installed"
#  exit
#}


TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi


#if [ ! -d "$HOME/.oh-my-zsh" ]; then
#  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#  cd /tmp && mkdir dotfile && cd ./dotfile && git clone https://github.com/JoshKaufman/oh-my-zsh-custom-config.git && mv ./oh-my-zsh-custom-config $HOME/.oh-my-zsh/custom
#fi

#exit 0
