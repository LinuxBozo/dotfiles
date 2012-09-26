#!/bin/bash

# --- Functions --- #
# Notice title
function notice { echo -e "\e[01;34m=> $1\e[00m"; }
#
# Error title
function error { echo -e "\e[00;31m=> Error: $1\e[00m"; }

cd "$(dirname "$0")"
notice "Updating repo.."
git pull --rebase origin master
git submodule init
git submodule update
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo -e "\e[01;34m=> Installing files..\e[00m"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  CWD=`pwd`
  excludes=".git gitprompt .DS_Store bootstrap.sh README.md"
  #rsync --exclude ".git/" --exclude "gitprompt/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
  for file in `ls -A`
  do
     if ! echo $excludes|grep $file > /dev/null
       then
            if [ -e $HOME/$file ]
            then
              rm -rf $HOME/$file
            fi
            ln -sf $CWD/$file $HOME/$file
       fi
  done
  # Treat the following a little different
  rm -rf $HOME/.git-prompt.sh
  ln -sf $CWD/gitprompt/git-prompt.sh $HOME/.git-prompt.sh
  rm -rf $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
  ln -sf $CWD/sublime2/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

fi
source "$HOME/.bash_profile"
notice "Done.."
