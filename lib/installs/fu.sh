#!/bin/bash
# Install fu

# https://github.com/samirahmed/fu
# A simple commandline utility for querying commandlinefu.com
#
# CommandlineFu.com is an awesome website written by David Winterbottom
# It has a collection of neat commandline one liners for the unix shell

echo "Installing Dependencies..."
sudo apt-get -qqy install python2.7 make &> $logfile

wget https://github.com/samirahmed/fu/zipball/master -O ~/Downloads/fu-installer.zip &> $logfile
mkdir ~/fu/ &> $logfile
unzip -o ~/Downloads/fu-installer.zip -d ~/fu/ &> $logfile
rm ~/Downloads/fu-installer.zip &> $logfile

pushd ~/fu/ &> $logfile
sudo make install &> $logfile
popd &> $logfile
rm -rf ~/fu/ &> $logfile
