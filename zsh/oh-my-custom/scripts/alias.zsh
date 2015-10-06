# alias


# [git]
alias gs="git status -s -b"
alias gp="git pull"
alias gd="git diff"

# [bash]
alias c="clear"
alias rload=". ~/.zshrc"
alias sub="sublime ."

alias sdiff="diff --side-by-side --suppress-common-lines "

alias muxinate="tmux kill-session"

# [npm]
alias pgulp="./node_modules/gulp/bin/gulp.js"

# [workspace global]
# # config
alias zshal="vim $ZSH/custom/alias.zsh"

PROJHOME="$HOME/projects"
export PROJHOME

# [amplify]
# # config
AMPHOME="$HOME/amplify"
amproj="$AMPHOME/parcc/edware"
export AMPHOME
export amproj

# [woubit]
# # config
WOUBHOME="$HOME/projects/woubit"
export WOUBHOME
alias woubser="cd $WOUBHOME/server && nodemon server.js"
alias woubcli="cd $WOUBHOME/client && npm start"

# # alias
alias ampactivate="source $AMPHOME/parcc/venv/bin/activate"
alias ampa="ampactivate"
alias ampd="deactivate"
alias ampser="cd $AMPHOME/parcc/edware/config && pserve development.ini"

