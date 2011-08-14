# Install google earth

VER=""
if (uname -a | grep 'x86_64'); then
  VER="amd64"
else
  VER="i386"
fi
wget -q http://dl.google.com/linux/direct/google-earth-stable_current_${VER}.deb -O ~/Downloads/google-earth-stable_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-earth-stable_current_${VER}.deb
rm ~/Downloads/google-earth-stable_current_${VER}.deb
