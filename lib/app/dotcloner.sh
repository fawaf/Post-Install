#!/bin/bash
# globs through the dotfile directory for available dotfiles to clone
root=$1
source $root/lib/app/helper.sh

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
  choose_from_selection $(ls $root/config/dotfiles/$1 | tr " " "\n")
}

function find_dottypes() {
  echo "available dotfile types"
  choose_from_selection $(ls $root/config/dotfiles)
  local dottype=$RETURN
  choose_dotfile $dottype
  local dotfile=$RETURN
  local dotfile_full=$root/config/dotfiles/$dottype/$dotfile
  echo "dottype $dottype"
  echo "dotfile $root/config/dotfiles/$dottype/$dotfile"
  replace_dotfile $dottype $dotfile_full
}

find_dottypes
