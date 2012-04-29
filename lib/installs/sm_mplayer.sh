#!/bin/bash
# Install SMplayer and Mplayer

echo "Installing Repositories..."
sudo apt-add-repository -y ppa:motumedia/mplayer-daily >> $logfile
sudo apt-add-repository -y ppa:rvm/smplayer >> $logfile
qq_update() >> $logfile
echo "Installing Mplayer and SMplayer..."
sudo apt-get -qqy install mplayer2 smplayer smplayer-themes smtube >> $logfile
