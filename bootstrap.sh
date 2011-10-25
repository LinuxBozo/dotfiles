#!/bin/bash

# --- Functions --- #
# Notice title
function notice { echo  "\033[1;32m=> $1\033[0m"; }
#
# Error title
function error { echo "\033[1;31m=> Error: $1\033[0m"; }

cd "$(dirname "$0")"
notice "Updating.."
git pull upstream master
git push
git submodule init
git submodule update
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
fi
source "$HOME/.bash_profile"
notice "Done.."
