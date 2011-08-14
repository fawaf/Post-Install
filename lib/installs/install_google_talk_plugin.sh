## Install google-talk plugin

determine_bitage
VER=$RETURN
echo "Installing Google Talk Plugin..."
sudo apt-get -qqy install lsb-core
wget http://dl.google.com/linux/direct/google-talkplugin_current_${VER}.deb -O ~/Downloads/google-talkplugin_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-talkplugin_current_${VER}.deb
rm ~/Downloads/google-talkplugin_current_${VER}.deb
