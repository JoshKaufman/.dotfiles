alias gs="git status -s -b"
alias gp="git pull"
alias gd="git diff"
alias gitdb="git diff master.."

# semi related
alias sdiff="diff --side-by-side --suppress-common-lines "

gupdate() {
    echo "updating all repos in $(pwd)";
    dirs=(./*/);
    if [ ${#dirs[@]} -gt 0 ]; then
        find ./* ! -name '.git' -type d -maxdepth 0 -print0 | while IFS= read -r -d '' folder; do
            echo "entering ${folder}";
            cd "$folder";
            if [ -d "./.git" ]; then
                echo "checking for updates";
                git fetch --all;
                git pull;
                echo "pull was success leaving ${folder}";
                cd ..;
            else
                echo "${folder} is not a git directory.. checking children";
                gupdate;
                cd ..;
            fi
        done
        echo "$(pwd) is now up to date with all remotes";
    else
        echo "no subdirectories found.";
    fi
}

gupdate2() {
    echo "updateing all repos in $(pwd)";
    dirs = find . -name '.git' -type d -exec '{}' +
    if [ ${#dirs[@]} -gt 0 ]; then
        find . -name '.git' -type d -print0 | while IFS= read -r -d '' gitfolder; do
            cd "$folder";
            cd ..;
            git fetch;
            git pull;
            echo "updated $(pwd)";
        done
    else
        echo "no git repos found!!"
    fi
}
