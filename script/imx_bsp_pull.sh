#! /bin/bash


function help( ) {
    echo "Usage: $0 <root folder> <git repo> <git branch> [xml file]"
    echo "root folder : folder in which the bsp will be installed"
    echo "git repo    : source repo from which download the bsp"
    echo "git branch  : source brach to pull"
    echo "xml file    : (option)"
    echo
}


if [[ $# -lt 3 ]]; then
    echo "ERROR: too few arguments"
    help
    exit 1
fi

ROOT_FOLDER=$1
GIT_REPO=$2
GIT_BRANCH=$3
if [[ $# -gt 3 ]]; then
    GIT_XML=$4
fi


if [[ ! -e $ROOT_FOLDER ]]; then

    mkdir -v $ROOT_FOLDER
    if [[ $? -eq 0 ]]; then 

        cd $ROOT_FOLDER
        if [[ -z $GIT_XML ]]; then
            echo "Exec: repo init init -u $GIT_REPO -b $GIT_BRANCH"
            repo init -u $GIT_REPO -b $GIT_BRANCH
        else
            echo "Exec: repo init -u $GIT_REPO -b $GIT_BRANCH -m $GIT_XML"
            repo init -u $GIT_REPO -b $GIT_BRANCH -m $GIT_XML
        fi
        if [[ ! $? -eq 0 ]]; then
            echo "ERROR to init the repo"
            echo "Revert task"
            cd ..
            rm -rfv $ROOT_FOLDER
            exit 1
        fi
        repo sync
        if [[ ! $? -eq 0 ]]; then
            echo "ERROR to sync the repo"
            echo "Revert task"
            cd ..
            rm -rfv $ROOT_FOLDER
            exit 1
        fi

    else
    
        echo "ERROR: impossible to create $ROOT_FOLDER folder"
        exit 1

    fi

else

    echo "ERROR: folder $ROOt_FOLDER already exists"
    exit 1

fi

echo "IMX yocto bsp pull operation Successful!!!"

exit 0