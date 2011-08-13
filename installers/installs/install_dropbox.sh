# Install dropbox

VER=""
if (uname -a | grep 'x86_64'); then
  VER="amd64"
else
  VER="i386"
fi
wget -q http://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.8_${VER}.deb -O ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
sudo dpkg -i ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
rm ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
