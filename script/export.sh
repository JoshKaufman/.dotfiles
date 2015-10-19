
if [[ -z "$DOTZ" ]]; then
  DOTZ="$HOME/dotfiles"
fi

##
# for now only attach files that are marked for export
# and will do it the dummy way. create 3 different sets of files... and 3 loops
##
typeset -U config_files
typeset -U path_files
typeset -U completion_files

# env files only exportable..
config_files=($DOTZ/**/*.export.zsh)
path_files=($DOTZ/**/path.zsh)
completion_files=($DOTZ/**/completion.zsh)

# load the path files
if test -n "$(find $DOTZ -maxdepth 3 -name 'path.zsh' -print -quit)"
then
  for file in ${path_files}
  do
    source $file
  done
else
  #echo 'no path files found \n something may have gone wrong'
fi

# load everything that is set for global..
for file in ${config_files}
do
  source $file
done

# load everything but the path and completion files
#for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
#do
  #source $file
#done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
if test -n "$(find $DOTZ -maxdepth 3 -name 'completion.zsh' -print -quit)"
then
  for file in ${completion_files}
  do
    source $file
  done
else
  #echo 'No completion files found \n something may have gone wrong'
fi



unset config_files
unset path_files
unset completion_files
