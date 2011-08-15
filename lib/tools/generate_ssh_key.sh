##generate ssh key

sudo apt-get -qqy install xclip

if [ -d ~/.ssh ]; then
	echo "The ~/.ssh directory already exists."
else
	mkdir ~/.ssh
fi

chmod 700 ~/.ssh
ssh-keygen -t rsa

newest_ssh_pub=`find ~ -type f -wholename $(ls -t ~/.ssh/*.pub | head -1)`

echo "Newest SSH Key: ${newest_ssh_pub}"
read -p "Copy Newest Public SSH Key to Clipboard (Y/n)? " sshcopy
if [[ "$sshcopy" == "y" || "$sshcopy" == "" ]]; then
	echo "SSH Key:"
	echo "---------------------------"
	cat ${newest_ssh_pub}
	echo "---------------------------"
	echo "Copied to Clipboard."
	xclip -in -selection c ${newest_ssh_pub}
fi

ssh-add ~/.ssh/id_rsa
