# Install google music manager

VER=""
if (uname -a | grep 'x86_64'); then
  VER="amd64"
else
  VER="i386"
fi
wget http://dl.google.com/linux/direct/google-musicmanager-beta_current_${VER}.deb -O ~/Downloads/google-musicmanager-beta_current_${VER}.deb
sudo dpkg -i ~/Downloads/google-musicmanager-beta_current_${VER}.deb
rm ~/Downloads/google-musicmanager-beta_current_${VER}.deb
