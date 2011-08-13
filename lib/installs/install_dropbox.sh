# Install dropbox

determine_bitage
VER=$RETURN
wget -q http://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.8_${VER}.deb -O ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
sudo dpkg -i ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
rm ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
