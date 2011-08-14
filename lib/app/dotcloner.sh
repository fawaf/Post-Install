# globs through the dotfile directory for available dotfiles to clone
source $1/lib/app/helper.sh $1

# $1 is the type of dotfile
# $2 is the dotfile to substitute in
function replace_dotfile {
  echo "This will replace your current $1,"
  echo -n "enter [y] if this is alright: "
  read -p "" REPLY
  if [[ ! (("$REPLY" == "y") || ("$REPLY" == "Y")) ]]; then
    echo "You said no. So This will not continue"
    return
  fi
  echo "Backing up $1 to $1.backup"
  $(cp -R ~/.$1 ~/.$1.backup)
  echo "Replacing $1 with $2"
  $(rm -rf ~/.$1)
  $(cp -R $2 ~/.$1)
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
