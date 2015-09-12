#!/bin/sh
#
# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cd /tmp && mkdir dotfile && cd ./dotfile && git clone https://github.com/JoshKaufman/oh-my-zsh-custom-config.git && mv ./oh-my-zsh-custom-config $HOME/.oh-my-zsh/custom
fi

exit 0
