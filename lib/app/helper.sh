# Helper.sh
# Includes helper functions that any other script can want to call.
# This file should only include functions but not actually run anything

# This is kind of important because ROOT will be set in all scripts the source helper.sh
ROOT=$1

sed_escape() {
  echo $1| sed -e 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g'
}

# Give the user the chance to read what might be on the screen
# Before doing something else.. waits for .5 seconds
hang() {
  sleep .5
}

# Takes in a space separated list and asks the user to choose one.
# Returns that choice. Generally you will pass
# $(ls some_directory) as the parameter
choose_from_selection() {
  choice=""

  #Only a null response will be ""
  while [[ "$choice" == "" ]]; do
    hang
    echo ""
    echo "Enter Index Number of Selection; n to escape"
    echo "Possible Selections: "

    declare -A selectables
    selectables["n"]=FAILURE && selectables["q"]=FAILURE
    local i=0
    for selection_type in $*; do
      echo [$i]: $selection_type
      selectables[$i]=$selection_type
      let i="$i+1"
    done

    read -p "> " REPLY
    REPLY_FL=$(lowercase $REPLY)
    choice=${selectables[$REPLY_FL]}
  done
  RETURN=$choice
}

lowercase() {
  echo $1 | tr '[A-Z]' '[a-z]'
}

first() {
  echo ${1:0:1}
}

echo_separator_bar() {
  echo "-----------------------------------------"
}

run_script() {
  selection=$1
  source $MINOR_DIRECTORY/$selection $ROOT
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

#this is important stuff for Mac! Makes sure the package manager is there
# 0 means you do not have Homebrew. 1 means you do.
check_homebrew () {
	if [ -d /usr/local/.git ]; then
	    HAVEHOMEBREW=1
	else
		HAVEHOMEBREW=0
	fi
}


#0 means you do not have wget. 1 means you do
check_wget () {
	if which wget >/dev/null; then
		HAVEWGET=1
	else
		HAVEWGET=0
	fi
}

#checks to see if you have this app in the Applications folder. 0 means no, 1 means yes.
check_app () {
	if [ -d /Applications/$1.app ]; then
		HAVEAPP=1
	else
		HAVEAPP=0
	fi
}
determine_bitage() {
  if (uname -a | grep 'x86_64'); then
    RETURN="amd64"
  else
    RETURN="i386"
  fi
}

# Takes a month number
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
