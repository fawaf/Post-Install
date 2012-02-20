#!/bin/bash
# Install autojump

echo "Installing Dependencies..."
sudo apt-get -qqy install python2.7 &> /dev/null

wget https://github.com/joelthelion/autojump/downloads -O ~/Downloads/autojump-downloads.html &> /dev/null
VALLSTABLE=`egrep -o -m 1 "\/downloads\/joelthelion\/autojump\/autojump_v[0-9]*\.tar\.gz" ~/Downloads/autojump-downloads.html` &> /dev/null

echo "https://github.com${VALLSTABLE}"
VER2=`echo "${VALLSTABLE}"|cut -d "." -f 1` &> /dev/null
VER=`echo "${VER2}"|cut -d "_" -f 2` &> /dev/null

rm ~/Downloads/autojump-downloads.html

wget https://github.com${VALLSTABLE} -O ~/Downloads/autojump-download.tar.gz &> /dev/null
mkdir ~/autojump/ &> /dev/null
tar -xvzf ~/Downloads/autojump-download.tar.gz -C ~/autojump/ &> /dev/null
rm ~/Downloads/autojump-download.tar.gz

cd ~/autojump/autojump_${VER}/ &> /dev/null
sudo ./install.sh &> /dev/null
cd ~
rm -rf ~/autojump/

if grep -Fxq "source /etc/profile" ~/.bashrc
then
	echo "source /etc/profile" >> ~/.bashrc
else
    echo "\"source /etc/profile\" already in ~\/.bashrc!"
fi
