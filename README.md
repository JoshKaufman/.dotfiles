# .dotfiles
My dot-files mostly for mac. its a tmux/vim setup.. you may love it or hate it. 


Right now it expects to be installed in `$HOME/dotfiles` so `cd $HOME && git clone https://github.com/JoshKaufman/.dotfiles.git dotfiles`

1. `cd $HOME/dotfiles && ./script/install` - installs common tools `zash, oh-my-zsh, homebrew...`
2. `cd $HOME/dotfiles && ./script/bootstrap` - symlinks all files `**.symlink to $HOME/.{filename}`
3. adds `sciprt/export.sh` to .zshrc then loads all files ***/**.export.zsh on startup as well as ****/path.zsh and ***/completion.zsh
4. make sure the bin folder is added to path's and run `dot` periodically to update apps (brew, oh-my-zsh...)

