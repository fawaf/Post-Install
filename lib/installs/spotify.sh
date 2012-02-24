#!/bin/bash
# Install spotify

logfile=/dev/null

echo "Installing Repository..."
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &> $logfile
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E &> $logfile
sudo apt-get -qq update &> $logfile
echo "Installing Spotify..."
sudo apt-get -qqy install spotify-client-qt &> $logfile
