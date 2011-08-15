# globs through the dotfile directory for available dotfiles to clone
source $1/lib/app/helper.sh $1
MINOR_DIRECTORY=$ROOT/config/dotfiles

# $1 is the type of dotfile
# $2 is the dotfile to substitute in
function replace_dotfile {
  dot_old=$1; dot_new=$2
  echo "This will replace your current $dot_old,"
  echo -n "enter [y] if this is alright: "
  read -p "" REPLY
  if [[ ! (("$REPLY" == "y") || ("$REPLY" == "Y")) ]]; then
    echo "You said no. So This will not continue"
    return
  fi

  echo "Backing up $dot_old to $dot_old.backup"
  $(cp -R ~/.$dot_old ~/.$dot_old.backup)
  echo "Replacing $dot_old with $dot_new"
  $(rm -rf ~/.$dot_old)
  $(cp -R $dot_new ~/.$dot_old)
}

# Searches through config/dotfiles for possible dotfile types
# Then searches through the user's choice of those for the
#   actual dotfiles. Then lets the user choose from those
#   and replace his dotfile with that choice(and backs up the old)
function find_dottypes() {
  echo_separator_bar
  echo "available dotfile types"
  choose_from_selection $(ls $MINOR_DIRECTORY)
  if [[ "$RETURN" == "FAILURE" ]]; then return; fi
  local dottype=$RETURN

  echo "Possible $dottype files to read"
  choose_from_selection $(ls $MINOR_DIRECTORY/$dottype)
  if [[ "$RETURN" == "FAILURE" ]]; then return; fi
  local dotfile=$RETURN
  local dotfile_full=$MINOR_DIRECTORY/$dottype/$dotfile

  echo "dotfile $MINOR_DIRECTORY/$dottype/$dotfile"
  replace_dotfile $dottype $dotfile_full
}

find_dottypes
