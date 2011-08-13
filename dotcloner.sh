#!/bin/bash
# globs through the dotfile directory for available dotfiles to clone

root_directory=$(pwd)

# Takes in a dotfile type
# and asks user to choose one
function choose_dotfile {
  echo ""
  echo "Possible $1 files to read"
  echo "Enter index number of dotfile to copy"
  local files=$(ls $root_directory/config/dotfiles/$1 | tr " " "\n")
  i=0

  for f in $files
  do
    echo $i: $f
    let i="$i+1"
  done

  read -p "> " REPLY
  echo "You chose " $files[$REPLY]
}

function find_dottypes() {
  echo "available dotfile types"
  ls $root_directory/config/dotfiles
}

choose_dotfile vimrc
