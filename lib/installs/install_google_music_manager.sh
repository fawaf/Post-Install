# Install google music manager

determine_bitage
VER=$RETURN
wget http://dl.google.com/linux/direct/google-musicmanager-beta_current_${VER}.deb -O ~/Downloads/google-musicmanager-beta_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-musicmanager-beta_current_${VER}.deb
rm ~/Downloads/google-musicmanager-beta_current_${VER}.deb
