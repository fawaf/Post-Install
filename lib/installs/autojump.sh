#!/bin/bash
# Install autojump

execute_command "echo \"fish\"" sudo

read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM

echo "Installing Dependencies..."
sudo apt-get -y install python2.7 &>> $logfile

wget https://github.com/joelthelion/autojump/downloads -O ~/Downloads/autojump-downloads.html &>> $logfile
VALLSTABLE=`egrep -o -m 1 "\/downloads\/joelthelion\/autojump\/autojump_v[0-9]*\.tar\.gz" ~/Downloads/autojump-downloads.html` &>> $logfile

VER2=`echo "${VALLSTABLE}"|cut -d "." -f 1` &>> $logfile
VER=`echo "${VER2}"|cut -d "_" -f 2` &>> $logfile

rm ~/Downloads/autojump-downloads.html

echo "Downloading and Installing Autojump..."
echo -e "\tDownloading file: https://github.com${VALLSTABLE}"
wget https://github.com${VALLSTABLE} -O ~/Downloads/autojump-download.tar.gz &>> $logfile
mkdir ~/autojump/ &>> $logfile
tar -xvzf ~/Downloads/autojump-download.tar.gz -C ~/autojump/ &>> $logfile
rm ~/Downloads/autojump-download.tar.gz &>> $logfile

cd ~/autojump/autojump_${VER}/ &>> $logfile
chmod +x install.sh
echo -e "\tInstalling Autojump"
sudo ./install.sh &>> $logfile
cd ~ &>> $logfile
rm -rf ~/autojump/ &>> $logfile

echo "Adding Autojump BashRC Lines..."
if grep -Fxq "source /etc/profile" ~/.bashrc
then
	echo -e "\t\"source /etc/profile\" already in ~/.bashrc!"
else
	echo -e "\t\"source /etc/profile\" added to ~/.bashrc!"
	echo "source /etc/profile" >> ~/.bashrc
fi
