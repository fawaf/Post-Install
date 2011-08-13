# Downloads and Installs Truecrypt

echo "Installing Truecrypt..."
VER=""
if (uname -a | grep 'x86_64'); then
  VER="x64"
else
  VER="x86"
fi
wget -q http://www.truecrypt.org/download/truecrypt-7.0a-linux-${VER}.tar.gz -O ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz
tar -zxvf ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz -C ~/Downloads/Truecrypt/
rm ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz
sudo ~/Downloads/Truecrypt/truecrypt-7.0a-setup-${VER}
rm -rf ~/Downloads/Truecrypt/
