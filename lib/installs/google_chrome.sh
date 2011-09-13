# Install google chrome

determine_bitage
VER=$RETURN

VC=""

while true; do
  read -p "Choose which Google Chrome version you wish to install (stable = 1, beta = 2, unstable = 3): " VCHROME
  if [ "$VCHROME" = 1 ]; then
    VC="stable"
    break
  elif [ "$VCHROME" = 2 ]; then
    VC="beta"
    break
  elif [ "$VCHROME" = 3 ]; then
    VC="unstable"
    break
  else
    echo ""
    echo "Invalid Choice!"
    echo ""
  fi
done

echo "Installing Google Chrome..."
sudo apt-get -qqy install lsb-core libnspr4-0d libcurl3
wget http://dl.google.com/linux/direct/google-chrome-${VC}_current_${VER}.deb -O ~/Downloads/google-chrome-${VC}_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-chrome-${VC}_current_${VER}.deb
rm ~/Downloads/google-chrome-${VC}_current_${VER}.deb
