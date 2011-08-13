#!/bin/bash
# globs through the dotfile directory for available dotfiles to clone

root_directory=$(pwd)

# Takes in a space separated list and allows
# user to choose one. returns that choice
function choose_from_selection {
  echo "Enter index number of dotfile to copy"
  echo "Possible Selections: "

  local i=0
  for selection_type in $*; do
    echo $i: $selection_type
    local selectables[$i]=$selection_type
    let i="$i+1"
  done

  read -p "> " REPLY
  RETURN=${selectables[$REPLY]}
}

# $1 is the type of dotfile
# $2 is the dotfile to substitute in
function replace_dotfile {
  echo "This will replace your current $1, enter y if this is alright"
  read -p "> " REPLY
  if [[ ! (("$REPLY" == "y") || ("$REPLY" == "Y")) ]]; then
    echo "You said no. So This will not continue"
    return
  fi
  echo "Backing up $1 to $1.backup"
  $(cp ~/.$1 ~/.$1.backup)
  echo "Replacing $1 with $2"
  $(cp $2 ~/.$1)
}
function choose_dotfile {
  echo ""
  echo "Possible $1 files to read"
  choose_from_selection $(ls $root_directory/config/dotfiles/$1 | tr " " "\n")
}

function find_dottypes() {
  echo "available dotfile types"
  choose_from_selection $(ls $root_directory/config/dotfiles)
  local dottype=$RETURN
  choose_dotfile $dottype
  local dotfile=$RETURN
  local dotfile_full=$root_directory/config/dotfiles/$dottype/$dotfile
  echo "dottype $dottype"
  echo "dotfile $root_directory/config/dotfiles/$dottype/$dotfile"
  replace_dotfile $dottype $dotfile_full
}

find_dottypes
#replace_dotfile vimrc poop
