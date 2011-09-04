# Install google music manager

determine_bitage
VER=$RETURN
echo "Installing Google Music Manager..."
sudo apt-get -qqy install lsb-core
wget http://dl.google.com/linux/direct/google-musicmanager-beta_current_${VER}.deb -O ~/Downloads/google-musicmanager-beta_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-musicmanager-beta_current_${VER}.deb
rm ~/Downloads/google-musicmanager-beta_current_${VER}.deb
