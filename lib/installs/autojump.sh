#!/bin/bash
# Install autojump

logfile=/dev/null

echo "Installing Dependencies..."
sudo apt-get -qqy install python2.7 &> $logfile

wget https://github.com/joelthelion/autojump/downloads -O ~/Downloads/autojump-downloads.html &> $logfile
VALLSTABLE=`egrep -o -m 1 "\/downloads\/joelthelion\/autojump\/autojump_v[0-9]*\.tar\.gz" ~/Downloads/autojump-downloads.html` &> $logfile

echo "https://github.com${VALLSTABLE}"
VER2=`echo "${VALLSTABLE}"|cut -d "." -f 1` &> $logfile
VER=`echo "${VER2}"|cut -d "_" -f 2` &> $logfile

rm ~/Downloads/autojump-downloads.html

wget https://github.com${VALLSTABLE} -O ~/Downloads/autojump-download.tar.gz &> $logfile
mkdir ~/autojump/ &> $logfile
tar -xvzf ~/Downloads/autojump-download.tar.gz -C ~/autojump/ &> $logfile
rm ~/Downloads/autojump-download.tar.gz &> $logfile

cd ~/autojump/autojump_${VER}/ &> $logfile
sudo ./install.sh &> $logfile
cd ~ &> $logfile
rm -rf ~/autojump/ &> $logfile

if grep -Fxq "source /etc/profile" ~/.bashrc
then
	echo "\"source /etc/profile\" already in ~\/.bashrc!"
else
	echo "source /etc/profile" >> ~/.bashrc &> $logfile
fi
