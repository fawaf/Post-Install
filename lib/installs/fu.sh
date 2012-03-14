#!/bin/bash
# Install fu

logfile=/dev/null

echo "Installing Dependencies..."
sudo apt-get -qqy install python2.7 make &> $logfile

wget https://github.com/samirahmed/fu/zipball/master -O ~/Downloads/fu-installer.zip &> $logfile
mkdir ~/fu/ &> $logfile
unzip -o ~/Downloads/fu-installer.zip -d ~/fu/ &> $logfile
rm ~/Downloads/fu-installer.zip &> $logfile

cd ~/fu/ &> $logfile
sudo make install &> $logfile
cd ~ &> $logfile
rm -rf ~/fu/ &> $logfile
