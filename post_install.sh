#!/bin/bash
## Trolling Manor Post Install Script for Ubuntu (11.04) AND MACOSX!!!!!!
## August 10, 2011
## Version 0.01

echo "-----------------------------------------"
echo "Welcome to the Trollingwood Manor Post Install Script!"
echo "-----------------------------------------"
echo ""

root=$(pwd) # 'pwd' is "present working directory"
installers="$root/installers/installs/"
source $root/lib/app/helper.sh
platform=''

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

remove_evolution_indicator () {
  sudo apt-get remove evolution-indicator
}

choose_what_to_do () {
  while true; do
    echo "[I]nstall Software"
    echo "[Q]uit or [Exit]"
    echo "[H]elp"
    echo "[M]ac = You are running a mac"
    echo "[D] = sudo apt-get -qq update"
    echo "[G] = sudo apt-get -qqy upgrade"
    echo "[P] = Change /usr/local Permissions"
    echo "[E} = Remove Evolution Indicator"
    echo "[A]lias Modifier"
    echo "[D]otfile Cloner"
    echo "666 = DO EVERYTHING!"
    echo ""
    read -p "Choose command: " REPLY

    # lowercases and extracts first character
    REPLY_FL=$(echo $REPLY | tr '[A-Z]' '[a-z]')
    REPLY_FL=${REPLY_FL:0:1}

    if [[ ("$REPLY_FL" == "q") || ("$REPLY" == "exit") ]]; then
      echo "Quiting..."
      return
    elif [[ "$REPLY_FL" == "i" ]]; then
      bash $root/lib/app/installer.sh $root
    elif [[ "$REPLY_FL" == "m" ]]; then
      bash $root/lib/app/mac_post_install.sh $root
    elif [[ "$REPLY_FL" = d ]]; then
      qq_update
    elif [[ "$REPLY_FL" = g ]]; then
      qqy_upgrade
    elif [[ "$REPLY_FL" = p ]]; then
      usr_local_permissions
    elif [[ "$REPLY_FL" = e ]]; then
      remove_evolution_indicator
    elif [[ "$REPLY_FL" = "a" ]]; then
      modify_aliases
    elif [[ "$REPLY_FL" == "d" ]]; then
      bash $root/lib/app/dotcloner.sh $root
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
