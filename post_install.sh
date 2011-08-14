#!/bin/bash
## Trolling Manor Post Install Script for Ubuntu (11.04) AND MACOSX!!!!!!
## August 10, 2011
## Version 0.01

echo "-----------------------------------------"
echo "Welcome to the Trollingwood Manor Post Install Script!"
echo "-----------------------------------------"
echo ""

root=$(pwd) # the root of the app. Pass into all other scripts
source $root/lib/app/helper.sh $root
platform=''

ureltemp=`egrep "DISTRIB_CODENAME=" /etc/lsb-release`
urel=`echo "${ureltemp}"|cut -d "=" -f 2`

#Takes the name of an app in lib/app
run_app () {
  bash $root/lib/app/$1 $root
}

mac_choose_what_to_do () {
  run_app mac_post_install.sh
}

choose_what_to_do () {
  while true; do
    echo "[A]lias Modifier"
    echo "[D]otfile Cloner"
    echo "[I]nstall Software"
    echo "[H]elp"
    echo "[M]ac = You are running a Mac"
    echo "[Q]uit or [Exit]"
    echo "[T]ools that aren't quite Installs. Like Miscellaneous"
    echo ""

    read -p "Choose Command: " REPLY

    # lowercases and extracts first character
    REPLY_FL=$(echo $REPLY | tr '[A-Z]' '[a-z]')
    REPLY_FL=${REPLY_FL:0:1}

    if [[ "$REPLY_FL" == "a" ]]; then
      run_app alias_modder.sh
    elif [[ "$REPLY_FL" == "d" ]]; then
      run_app dotcloner.sh
    elif [[ "$REPLY_FL" == "i" ]]; then
      run_app installer.sh
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

determine_OS

if [[ "$platform" == MACOSX ]]; then
  mac_choose_what_to_do
elif [[ "$platform" == Linux ]]; then
  choose_what_to_do
else
  echo "Sorry bud but your OS is a pile of shit"
fi
