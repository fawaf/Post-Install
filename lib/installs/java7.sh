#!/bin/bash
## install Java 7

logfile=/dev/null

echo "Adding Repository..."
sudo add-apt-repository -y ppa:webupd8team/java &> $logfile
sudo apt-get -qq update &> $logfile
sudo mkdir -p /usr/lib/mozilla/plugins &> $logfile
echo "Downloading and Installing Java 7..."
sudo apt-get -qqy install oracle-jdk7-installer &> $logfile
