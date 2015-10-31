
# [amplify]
# # config
AMPHOME="$HOME/amplify"
amproj="$AMPHOME/parcc/edware"
export AMPHOME
export amproj


alias ampactivate="source $AMPHOME/parcc/venv/bin/activate"
alias ampa="ampactivate"
alias ampd="deactivate"
alias ampser="cd $AMPHOME/parcc/edware/config && pserve development.ini"
