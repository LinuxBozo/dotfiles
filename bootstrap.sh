#!/bin/bash

# --- Functions --- #
# Notice title
function notice { echo  "\033[1;32m=> $1\033[0m"; }
#
# Error title
function error { echo "\033[1;31m=> Error: $1\033[0m"; }

cd "$(dirname "$0")"
notice "Updating.."
git pull --rebase origin master 
git submodule init
git submodule update
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  CWD=`pwd`
  excludes=".git gitprompt .DS_Store bootstrap.sh README.md"
  #rsync --exclude ".git/" --exclude "gitprompt/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
  for file in `ls -A`
  do
     if ! echo $excludes|grep $file > /dev/null
       then
            if [ -e ~/$file ]
            then
              rm -rf ~/$file
            fi
            ln -sf $CWD/$file ~
       fi
  done
  rm -rf ~/.git-prompt.sh
  ln -sf $CWD/gitprompt/git-prompt.sh ~/.git-prompt.sh
fi
source "$HOME/.bash_profile"
notice "Done.."
