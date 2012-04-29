#!/bin/bash
# Downloads and Installs Truecrypt

err=`wget http://www.truecrypt.org/downloads -O ~/Downloads/truecrypt-index.html` &>> $logfile
VSTABLE=`egrep -o "Latest Stable Version - .*</h1>" ~/Downloads/truecrypt-index.html` &>> $logfile
TVER=`echo "${VSTABLE}"|cut -d " " -f 5|cut -d "<" -f 1` &>> $logfile

rm ~/Downloads/truecrypt-index.html &>> $logfile

read -p "Install Truecrypt v${TVER} (y/n)? " CONFIRM
echo ""
if [ "$CONFIRM" = n ]; then
  echo "Quiting..."
else
	echo "Installing Truecrypt..."
	if (uname -a | grep 'x86_64'); then
	  VER="x64"
	else
	  VER="x86"
	fi
	
	mkdir ~/Downloads/Truecrypt &>> $logfile
	
	echo "Downloading Truecrypt..."
	wget http://www.truecrypt.org/download/truecrypt-${TVER}-linux-${VER}.tar.gz -O ~/Downloads/truecrypt-${TVER}-linux-${VER}.tar.gz &>> $logfile
	tar -zxvf ~/Downloads/truecrypt-${TVER}-linux-${VER}.tar.gz -C ~/Downloads/Truecrypt/ &>> $logfile
	rm ~/Downloads/truecrypt-${TVER}-linux-${VER}.tar.gz &>> $logfile
	echo "Installing Truecrypt..."
	sudo ~/Downloads/Truecrypt/truecrypt-${TVER}-setup-${VER} &>> $logfile
	rm -rf ~/Downloads/Truecrypt &>> $logfile
fi
