# Helper.sh
# Includes helper functions that any other script can want to call.
# This file should only include functions but not actually run anything

# This is kind of important because root will be set in all scripts the source helper.sh
root=$1

sed_escape() {
  echo $1| sed -e 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g'
}

# Takes in a space separated list and allows
# user to choose one. returns that choice
choose_from_selection() {
  echo "Enter Index Number of Selection"
  echo "Possible Selections: "

  local i=0
  for selection_type in $*; do
    echo [$i]: $selection_type
    local selectables[$i]=$selection_type
    let i="$i+1"
  done

  read -p "> " REPLY
  RETURN=${selectables[$REPLY]}
}

determine_OS() {
  if (uname -a | grep 'Darwin'); then
    platform='MACOSX'
  elif (uname -a | grep 'Linux'); then
    platform='Linux'
  else
    platform='Unknown'
  fi
}

determine_bitage() {
  if (uname -a | grep 'x86_64'); then
    RETURN="amd64"
  else
    RETURN="i386"
  fi
}

get_month() {
  if [ "$1" = 01 ]||[ "$1" = 1 ]; then
    echo "January"
  elif [ "$1" = 02 ]||[ "$1" = 2 ]; then
    echo "February"
  elif [ "$1" = 03 ]||[ "$1" = 3 ]; then
    echo "March"
  elif [ "$1" = 04 ]||[ "$1" = 4 ]; then
    echo "April"
  elif [ "$1" = 05 ]||[ "$1" = 5 ]; then
    echo "May"
  elif [ "$1" = 06 ]||[ "$1" = 6 ]; then
    echo "June"
  elif [ "$1" = 07 ]||[ "$1" = 7 ]; then
    echo "July"
  elif [ "$1" = 08 ]||[ "$1" = 8 ]; then
    echo "August"
  elif [ "$1" = 09 ]||[ "$1" = 9 ]; then
    echo "September"
  elif [ "$1" = 10 ]; then
    echo "October"
  elif [ "$1" = 11 ]; then
    echo "November"
  elif [ "$1" = 12 ]; then
    echo "December"
  else
    echo "ERROR: Invalid month number"
  fi
}

qq_update() {
  echo "sudo apt-get -qq update..."
  sudo apt-get -qq update
}
qq_upgrade() {
  echo "sudo apt-get -qqy upgrade..."
  qq_update
  sudo apt-get -qqy upgrade
}
