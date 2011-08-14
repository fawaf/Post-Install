# Install Hulu Desktop
VER=""
if (uname -a | grep 'x86_64'); then
  VER="amd64"
else
  VER="i386"
fi
wget -q http://download.hulu.com/huludesktop_${VER}.deb -O ~/Downloads/huludesktop_${VER}.deb
sudo dpkg -i ~/Downloads/huludesktop_${VER}.deb
rm ~/Downloads/huludesktop_${VER}.deb
