#!/bin/bash
## install Sublime Text 2

echo "Adding Repository..."
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2 &>> $logfile
sudo apt-get -qq update &>> $logfile
echo -e "What version of Sublime Text 2 would you like to install (1=dev, \033[1m2=beta\033[0m)?"
read -p "Option: " CONFIRM
echo ""

if [ "$CONFIRM" = 1 ]; then
	echo "Downloading and Installing Sublime Text 2 Dev..."
	sudo apt-get -qqy install sublime-text-2-dev &>> $logfile
elif [ "$CONFIRM" = 2 ]; then
	echo "Downloading and Installing Sublime Text 2 Beta..."
	sudo apt-get -qqy install sublime-text-2-beta &>> $logfile
else
	echo "Downloading and Installing Sublime Text 2 Beta..."
	sudo apt-get -qqy install sublime-text-2-beta &>> $logfile
fi

echo "Installing Sublime Package Control..."
wget "http://sublime.wbond.net/Package%20Control.sublime-package" -O ~/"Downloads/Package Control.sublime-package" &>> $logfile
mv ~/"Downloads/Package Control.sublime-package" ~/".config/sublime-text-2/Installed Packages" &>> $logfile
