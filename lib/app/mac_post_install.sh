# Kevin's crap
# It's all crap for mac
# I mean really... you have to install wget manually!
source $1/lib/app/helper.sh $1

check_homebrew () {
  if [ -d /usr/local/.git ]; then
    return 0
  fi
  echo "You don't have Homebrew installed."
  return 1
}

install_wget () {
  check_homebrew
  if [ $* == 1 ]; then
    return 1
  fi
  brew install wget
}

install_homebrew () {
  if [ -d /usr/local/.git ]; then
    echo "Homebrew is already installed"
  else 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
  fi
}

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

echo "Installer for Mac Software... Kevin's crapola!"
choose_what_to_do
