#!/bin/bash
## Trolling Manor Post Install Script for Ubuntu (11.04) AND MACOSX!!!!!!

ROOT=$(pwd) # the root of the app. Pass into all other scripts.
source $ROOT/lib/app/helper.sh $ROOT
platform=''

if [ -d "/etc/lsb-release/" ]; then
	ureltemp=`egrep "DISTRIB_CODENAME=" /etc/lsb-release` #This only works on Ubuntu.
	urel=`echo "${ureltemp}"|cut -d "=" -f 2`
else #otherwise you're cool and have a Mac
	ureltemp=""
	urel=""
fi

# Takes the name of an app in lib/app and runs it
# Creates a completely new environment for it
run_app() {
  app=$1
  bash $ROOT/lib/app/$app $ROOT
}

mac_choose_what_to_do() {
  run_app mac_post_install.sh
}

help_message() {
  echo "Friendship is Magic!" #whoever decided on this is a gentleman and a scholar.
}

choose_what_to_do() {
  while true; do
    hang
    echo "[A]lias Modifier"
    echo "[D]otfile Cloner"
    echo "[I]nstall Software"
    echo "[S]imple installs"
    echo "[H]elp"
    echo "[M]ac = You are running a Mac"
    echo "[Q]uit or [exit]"
    echo "[T]ools that aren't quite Installs. Like Miscellaneous"
    echo ""

    read -p "Choose Command: " REPLY

    # lowercases and extracts first character
    REPLY_FL=$(first $(lowercase $REPLY))

    if [[ "$REPLY_FL" == "a" ]]; then
      run_app alias_modder.sh
    elif [[ "$REPLY_FL" == "d" ]]; then
      run_app dotcloner.sh
    elif [[ "$REPLY_FL" == "i" ]]; then
      run_app installer.sh
    elif [[ "$REPLY_FL" == "s" ]]; then
      run_app simple.sh
    elif [[ "$REPLY_FL" == 'h' ]]; then
      help_message
    elif [[ "$REPLY_FL" == "m" ]]; then
      mac_choose_what_to_do
    elif [[ ("$REPLY_FL" == "q") || ("$REPLY" == "exit") ]]; then
      echo "Quiting..."
      exit
    elif [[ "$REPLY_FL" == "t" ]]; then
      run_app tooler.sh
    else
      echo "Invalid Choice!"
    fi
    echo ""
  done
}

echo_separator_bar
echo "Welcome to the Trollingwood Manor Post Install Script!"
echo_separator_bar
echo ""

determine_OS

if [[ "$platform" == MACOSX ]]; then
	mac_choose_what_to_do
elif [[ "$platform" == Linux ]]; then
  	choose_what_to_do
else
  echo "Sorry bud but your OS is a pile of shit"
fi
