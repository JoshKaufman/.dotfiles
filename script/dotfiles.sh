
if [[ -z "$DOTZ" ]]; then
    DOTZ="$HOME/dotfiles"
fi

typeset -U plugin_files
typeset -U config_files
typeset -U path_files
typeset -U completions_files

path_files=($DOTZ/**/*path.zsh)
config_files=($DOTZ/**/*.export.zsh)
completion_files=($DOTZ/**/*completion.zsh)
plugin_files=($DOTZ/**/*.plugin.zsh)

# load the path files
if test -n "$(find $DOTZ -maxdepth 3 -name = 'path.zsh' -print -quit)"
then
    for file in ${path_files}
    do
        source $file
    done
else
    echo 'no path files found \n something may have gone wrong'
fi

for file in ${plugin_files}
do
    fpath=(${file%%.*} fpath)
done

# load everything that is set for global..
for file in ${config_files}
do
  source $file
done

for file in ${plugin_files}
do
    source $file
done

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
  echo 'No completion files found \n something may have gone wrong'
fi



unset config_files
unset path_files
unset completion_files
unset plugin_files
