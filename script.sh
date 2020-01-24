#!/bin/bash

# Sources
. ./commiter.sh

# Handle args
while getopts ":r:d:p:" opt; do
    case $opt in
    r)
        repo="$OPTARG"
        ;;
    d)
        commit_days="$OPTARG"
        ;;
    p)
        path="$OPTARG"
        ;;
    \?)
        echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done

cd $path

if git rev-parse --git-dir >/dev/null 2>&1; then
    echo "This is active git repository. Please choose another folder"
    exit 1
fi

mkdir FILES && cd ./FILES

# Commits process
git init
message='Commit message'

for ((i = 1; i <= $commit_days; i++)); do
    echo HELLO >"FILE${i}.TXT"
    git add .
    git commit -m "$message"
    when=$(date -R -v-"$i"d)
    GIT_COMMITTER_DATE="$when" git commit --amend --no-edit --date "$when"
done

git remote add origin "$repo"
git push --force origin master

cd .. && rm -rf ./FILES
