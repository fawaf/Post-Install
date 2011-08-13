# Install google chrome

determine_bitage
VER=$RETURN
wget -q http://dl.google.com/linux/direct/google-chrome-stable_current_${VER}.deb -O ~/Downloads/google-chrome-stable_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_${VER}.deb
rm ~/Downloads/google-chrome-stable_current_${VER}.deb
