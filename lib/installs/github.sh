#!/bin/bash
## install git and configure

logfile=/dev/null

echo "Adding Repository..."
sudo apt-add-repository -y ppa:git-core/ppa &> $logfile
sudo apt-get -qq update &> $logfile

git config color.ui true &> $logfile

sudo apt-get -qqy install git xclip &> $logfile

read -p "Github User Name: " USERNAME
read -p "Github Email    : " EMAIL

git config --global user.name $USERNAME &> $logfile
git config --global user.email $EMAIL &> $logfile

newest_ssh_pub=`find ~ -type f -wholename $(ls -t ~/.ssh/*.pub | head -1)` &> $logfile
xclip -in -selection c ${newest_ssh_pub} &> $logfile

echo "Proceed to https://github.com/account/ssh and add your ssh key to your account."
echo "This is your ssh key, and it is now in your clipboard"

echo "SSH Key:"
echo "---------------------------"
cat ${newest_ssh_pub}
echo "---------------------------"
echo "Copied to Clipboard."
	
echo "If the section above is empty, then you need to go to the ssh key gen tool in post-install."
echo "Setting up bash tab autocompletion for git... not. I'm too lazy"
