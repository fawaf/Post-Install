# Super cool Macintosh Post_Install script
# Going to be modeled after the Ubuntu version...hopefully everything survives!

source $1/lib/app/helper.sh $1
MINOR_DIRECTORY=$ROOT/lib/macinstalls
HAVEHOMEBREW=""

run_app() {
  app=$1
  bash $ROOT/lib/app/$app $ROOT
}

echo_separator_bar
echo "Welcome to the Macintosh Post-Install Script"

update_homebrew () {
  #check_homebrew; if [ $* == 1 ]; then; return; fi;
  brew update
}

install_node () {
  #check_homebrew; if [ $* == 1 ]; then; return; fi;
  brew install node
  echo "Installing npm..."
  curl http://npmjs.org/install.sh | clean=yes sh
}

install_chrome () {
  wget -q http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg -O ~/Downloads/GoogleChrome.dmg
  hdiutil mount -quiet ~/Downloads/GoogleChrome.dmg
  cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
  hdiutil unmount -quiet "/Volumes/Google Chrome"
  rm ~/Downloads/GoogleChrome.dmg
}

install_dropbox () {
  wget -q http://cdn.dropbox.com/Dropbox%201.1.35.dmg -O ~/Downloads/Dropbox.dmg
  hdiutil mount -quiet ~/Downloads/Dropbox.dmg
  cp -R "/Volumes/Dropbox Install/Dropbox.app" /Applications
  hdiutil unmount -quiet "/Volumes/Dropbox Install"
  rm ~/Downloads/Dropbox.dmg
}

install_adium () {
  wget -q http://download.adium.im/Adium_1.4.2.dmg -O ~/Downloads/Adium.dmg
  hdiutil mount -quiet ~/Downloads/Adium.dmg
  cp -R "/Volumes/Adium 1.4.2/Adium.app" /Applications
  hdiutil unmount -quiet "/Volumes/Adium 1.4.2"
  rm ~/Downloads/Adium.dmg
}

install_libreoffice () {
  wget -q http://download.documentfoundation.org/libreoffice/stable/3.3.3/mac/x86/LibO_3.3.3_MacOS_x86_install_en-US.dmg -O ~/Downloads/LibreOffice.dmg
  hdiutil mount -quiet ~/Downloads/LibreOffice.dmg
  cp -R "/Volumes/LibreOffice 3.3/LibreOffice.app" /Applications
  hdiutil unmount -quiet "/Volumes/LibreOffice 3.3"
  rm ~/Downloads/LibreOffice.dmg
}

choose_what_to_do () {
	while true; do
	    hang
	    echo "[A]lias Modifier (Untested)"
	    echo "[D]otfile Cloner (Untested)"
	    echo "[I]nstall Software (Working on it)"
	    echo "[H]elp (Bugged)"
	    echo "[Q]uit or [Exit]"
	    echo "[T]ools that aren't quite installs. Miscellaneous. (Untested)"
	    echo ""

	    read -p "Choose Command: " REPLY

	    # lowercases and extracts first character
	    REPLY_FL=$(first $(lowercase $REPLY))

	    if [[ "$REPLY_FL" == "a" ]]; then
	      run_app alias_modder.sh
	    elif [[ "$REPLY_FL" == "d" ]]; then
	      run_app dotcloner.sh
	    elif [[ "$REPLY_FL" == "i" ]]; then
	      run_app mac_installer.sh
	    elif [[ "$REPLY_FL" == 'h' ]]; then
	      help_message
	    elif [[ ("$REPLY_FL" == "q") || ("$REPLY" == "exit") ]]; then
	      echo "Quitting..."
	      exit
	    elif [[ "$REPLY_FL" == "t" ]]; then
	      run_app tooler.sh
	    else
	      echo "Invalid Choice!"
	    fi
	    echo ""
	  done
}

old_choose_what_to_do () {
  echo "Note: Yes I know this is much more limited...FOR NOW"
  while true; do
    echo "q = Quit"
    echo "u = update homebrew"
    echo "1 = Install Homebrew (prerequisite for many things)"
    echo "2 = Modify Aliases"
    echo "3 = Install Node and NPM"
    echo "4 = Install Google Chrome"
    echo "5 = Install Dropbox"
    echo "6 = Install Adium"
    echo "7 = Install LibreOffice"
    echo "666 = DO EVERYTHING!"
    read -p "Choose command: " REPLY
    if [ "$REPLY" = q ]; then
      echo "Quitting..."
      break
    elif [ "$REPLY" = u ]; then
      update_homebrew
    elif [ "$REPLY" = 0 ]; then
      install_wget
    elif [ "$REPLY" = 1 ]; then
      install_homebrew
    elif [ "$REPLY" = 2]; then
      modify_aliases
    elif [ "$REPLY" = 3]; then
      install_node
    elif [ "$REPLY" = 4]; then
      install_chrome
    elif [ "$REPLY" = 5]; then
      install_dropbox
    elif [ "$REPLY" = 6]; then
      install_adium
    elif [ "$REPLY" = 7]; then
      install_libreoffice
    elif [ "$REPLY" = 666 ]; then
      echo "Doesn't work yet"
    else
      echo "Invalid Choice"
    fi
    echo ""
  done
}

help_message() {
  echo "Macs are 20% cooler!" #whoever decided on this is a gentleman and a scholar.
}

choose_what_to_do