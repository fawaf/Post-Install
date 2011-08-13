#!/bin/bash
## Trolling Manor Post Install Script for Ubuntu (11.04) AND MACOSX!!!!!!
## August 10, 2011
## Version 0.01

echo "-----------------------------------------"
echo "Welcome to the Trollingwood Manor Post Install Script!"
echo "-----------------------------------------"
echo ""

f=$(pwd) # 'pwd' is "present working directory"
platform=''

sed_escape () {
  echo $1| sed -e 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g'
}


determine_OS () {
  echo "Determining your operating System!"
  if (uname -a | grep 'Darwin'); then
    platform='MACOSX'
  elif (uname -a | grep 'Linux'); then
    platform='Linux'
  else
    platform='Unknown'
  fi
}

usr_local_permissions () {
  read -p "Change Permissions of /usr/local to ${USER} (y/n): " REPLY
  if [ "$REPLY" = n ]; then
    echo "Not Changing Permissions..."
  else
    echo "setting /usr/local directory permissions to ${USER}..."
    sudo chown -R $USER /usr/local
  fi
}

qq_update () {
  echo "sudo apt-get -qq update..."
  sudo apt-get -qq update
}

qqy_upgrade () {
  echo "sudo apt-get -qqy upgrade..."
  qq_update
  sudo apt-get -qqy upgrade
}

get_month () {
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

remove_evolution_indicator () {
  sudo apt-get remove evolution-indicator
}

choose_what_to_do () {
  while true; do
    echo "installables: wifi_resume_script google_talk_plugin google_chrome"
    echo "  google_earth google_music_manager dropbox minecraft truecrypt"
    echo "  huludesktop gedit_plugins apps_no_repos apps_yes_repos"
    echo "  super_os_repo repositories vaioz_app node nowtable"
    echo "q = Quit"
    echo "h = Help"
    echo "mac = You are running a mac"
    echo "d = sudo apt-get -qq update"
    echo "g = sudo apt-get -qqy upgrade"
    echo "1 = Install Repositories"
    echo "2 = Change /usr/local Permissions"
    echo "12 = Remove Evolution Indicator"
    echo "aliases = Modify Aliases"
    echo "dotfiles = Copy over example dotfiles"
    echo "666 = DO EVERYTHING!"
    echo ""
    read -p "Choose command: " REPLY
    if [[ ("$REPLY" == "q") || ("$REPLY" == "exit") ]]; then
      echo "Quiting..."
      return
    elif [[ "$(expr index $REPLY install_)" == 1 ]]; then
      echo "running $REPLY"
      $REPLY
    elif [[ "$REPLY" == "mac" ]]; then
      bash mac_post_install.sh
    elif [[ "$REPLY" = d ]]; then
      qq_update
    elif [[ "$REPLY" = g ]]; then
      qqy_upgrade
    elif [[ "$REPLY" = 2 ]]; then
      usr_local_permissions
    elif [[ "$REPLY" = 12 ]]; then
      remove_evolution_indicator
    elif [[ "$REPLY" = "aliases" ]]; then
      modify_aliases
    elif [[ "$REPLY" == "dotfiles" ]]; then
      bash dotcloner.sh
    elif [[ "$REPLY" = 666 ]]; then
      usr_local_permissions
      qq_update
      install_repositories
      install_google_talk_plugin
      install_google_chrome
      install_google_earth
      install_google_music_manager
      install_dropbox
      install_minecraft
      install_gedit_plugins
      qq_update
      install_apps_yes_repos
      qq_update
      install_vaioz_app
      remove_evolution_indicator
      qq_update
      install_node
      install_nowtable
      install_wifi_resume_script
      qq_update
      qqy_upgrade
    else
      echo "Invalid Choice!"
    fi
    echo ""
  done
}




##MODIFYING ALIASES
modify_aliases () {
  echo "---------------------------"
  echo "Modify your aliases here!"
  echo "---------------------------"
  touch ~/.post-aliases
  while true; do
    echo "q = Quit"
    echo "1 = Fix dot navigation"
    read -p "Choose command: " REPLY
    if [ "$REPLY" = q ]; then
      echo "Quitting..."
      break
    elif [ "$REPLY" = 1 ]; then
      FOUND=`egrep "alias \.\.=" ~/.post-aliases`
      if [ ${FOUND} ]; then
        echo "Found something already"
        echo $FOUND
        sed -ie "s/alias ..(.)$/alias ..='cd ..'/" ~/.post-aliases
      else
        echo "Not found"
        echo -e "alias ..=\"cd ..\"" | tee -a ~/.post-aliases
      fi
    else
      echo "Invalid choice"
    fi
  done
}

determine_OS

if [ "$platform" = MACOSX ]; then
  mac_choose_what_to_do
elif [ "$platform" = Linux ]; then
  choose_what_to_do
else
  echo "Sorry bud but your OS sucks"
fi
