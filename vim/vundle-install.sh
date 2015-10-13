if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  # install vudnle
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

  # install/update vim plugins using vundle
  vim +PluginInstall! +qall
fi
