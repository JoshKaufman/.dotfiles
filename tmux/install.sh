#!/bin/sh
#
# Tmux
# This isntalls tmux plus some of the dependencies.
# (reattach-to-user-namespace)

# check for tmux
if ! type "tmux" &> /dev/null;
then
 echo " Installing tmux for you.."
 brew install tmux
fi

if ! type "reattach-to-user-namespace" &> /dev/null;
then
  echo " Installing reattach-to-user-namespace"
  brew install reattach-to-user-namespace
fi

if ! type "mux" &> /dev/null;
then
  gem install tmuxinator
fi

