#!/bin/bash
## install mercurial and configure

logfile=/dev/null

echo "Adding Repository..."
sudo apt-add-repository -y ppa:mercurial-ppa/releases &> $logfile
sudo apt-get -qq update &> $logfile

sudo apt-get -qqy install git xclip &> $logfile

read -p "Bitbucket User Name: " USERNAME
read -p "Bitbucket Email    : " EMAIL

echo -e "[ui]\nusername = ${USERNAME} <${EMAIL}>" | sudo tee ~/.hgrc &> $logfile

if [ -e ~/.ssh/*.pub ]
then
	echo "SSH key already exists"
else
	echo "No SSH key found, generating new one"
	$ROOT/lib/tools/generate_ssh_key.sh
fi

newest_ssh_pub=`find ~ -type f -wholename $(ls -t ~/.ssh/*.pub | head -1)` &> $logfile
xclip -in -selection c ${newest_ssh_pub} &> $logfile

echo "Proceed to https://bitbucket.org/account/ssh-keys/ and add your ssh key to your account."
echo "This is your ssh key, and it is now in your clipboard"

echo "SSH Key:"
echo "---------------------------"
cat ${newest_ssh_pub}
echo "---------------------------"
echo "Copied to Clipboard."
	
echo "If the section above is empty, then you need to go to the ssh key gen tool in post-install."
echo "Setting up bash tab autocompletion for git... not. I'm too lazy"
