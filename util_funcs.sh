function vimd ()
{
    vim -p $(git diff --relative --name-only)
}

function vgrep ()
{
    vim -p $(egrep -ril "$1" | sort | uniq)
}

function vfind ()
{
    vim -p $(find . -name "$1")
}
