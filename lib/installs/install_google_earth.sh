# Install google earth

determine_bitage
VER=$RETURN
wget -q http://dl.google.com/linux/direct/google-earth-stable_current_${VER}.deb -O ~/Downloads/google-earth-stable_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-earth-stable_current_${VER}.deb
rm ~/Downloads/google-earth-stable_current_${VER}.deb
