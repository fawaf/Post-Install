## Install google-talk plugin

determine_bitage
VER=$RETURN
wget -q http://dl.google.com/linux/direct/google-talkplugin_current_${VER}.deb -O ~/Downloads/google-talkplugin_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-talkplugin_current_${VER}.deb
rm ~/Downloads/google-talkplugin_current_${VER}.deb
