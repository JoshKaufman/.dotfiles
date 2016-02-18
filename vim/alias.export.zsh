alias ctag='ctags --tag-relative=yes -R --exclude=.git --exclude=node_modules --exclude=dist --exclude=bin --exclude=.coverage .'
alias jtag='find -E . -type f -iregex ".*\.(js|jsx|json|es6|es2015)$" -not -path "./node_modules/*" -not -path "./dist/*" -not -path "./.coverage" -not -path "./.git" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
