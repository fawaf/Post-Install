#!/bin/bash
# Install spotify

echo "Installing Repository..."
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &> /dev/null
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E &> /dev/null
sudo apt-get -qq update &> /dev/null
echo "Installing Spotify..."
sudo apt-get -qqy install spotify-client-qt &> /dev/null
