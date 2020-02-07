#!/bin/bash

# Sources
. ./commiter.sh

# Platform check
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macos'
fi

# Handle args
while getopts ":r:d:p:m:" opt; do
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
    m)
        max_commits="$OPTARG"
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

for ((day = 1; day <= $commit_days; day++)); do
    mkdir DAY${day} && cd ./DAY${day}
    for ((file = 1; file <= RANDOM % $max_commits; file++)); do
        echo HELLO >"FILE${file}.txt"
        git add .
        git commit -m "$message"
        when='empty'
        if [[ $platform == 'linux' ]]; then
            when=$(date -R -d "$day"+ "days ago")
        elif [[ $platform == 'macos' ]]; then
            when=$(date -R -v-"$day"d)
        fi
        GIT_COMMITTER_DATE="$when" git commit --amend --no-edit --date "$when"
    done
    cd ..
done

git remote add origin "$repo"
git push --force origin master

cd .. && rm -rf ./FILES
