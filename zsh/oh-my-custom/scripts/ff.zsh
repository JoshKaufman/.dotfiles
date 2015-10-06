function ff()
{
    local fullpath=$*
    local filename=${fullpath##*/} # remove "/" from the beginning
    filename=${filename##*./} # remove  ".../" from the beginning
    echo file=$filename
    local ignored="*/target/ .svn .git .sass-cache .hg .pyc"
    for ignore in $ignored
    do
        local ignored_command=${ignored_command}" -not -iwholename $ignore "
    done
    echo ${ignored_command}
    local cli=`find $PWD ${ignored_command} -type f -iwholename '*'${filename}'*' -print | percol`
    echo ${cli}
    echo -n ${cli} | pbcopy
}
