#!/bin/bash
## Trolling Manor Post Install Script for Ubuntu (11.04) AND MACOSX!!!!!!
## August 10, 2011
## Version 0.01

echo "-----------------------------------------"
echo "Welcome to the Trollingwood Manor Post Install Script!"
echo "-----------------------------------------"
echo ""

f=$(pwd) # 'pwd' is "present working directory"
platform=''

sed_escape () {
	echo $1| sed -e 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g'
}


determine_OS () {
	echo "Determining your operating System!"
	if (uname -a | grep 'Darwin'); then
		platform='MACOSX'
	elif (uname -a | grep 'Linux'); then
		platform='Linux'
	else
		platform='Unknown'
	fi
}

usr_local_permissions () {
	read -p "Change Permissions of /usr/local to ${USER} (y/n): " REPLY
	if [ "$REPLY" = n ]; then
		echo "Not Changing Permissions..."
	else
		echo "setting /usr/local directory permissions to ${USER}..."
		sudo chown -R $USER /usr/local
	fi
}

qq_update () {
	echo "sudo apt-get -qq update..."
	sudo apt-get -qq update
}

qqy_upgrade () {
	echo "sudo apt-get -qqy upgrade..."
	qq_update
	sudo apt-get -qqy upgrade
}

get_month () {
	if [ "$1" = 01 ]||[ "$1" = 1 ]; then
		echo "January"
	elif [ "$1" = 02 ]||[ "$1" = 2 ]; then
		echo "February"
	elif [ "$1" = 03 ]||[ "$1" = 3 ]; then
		echo "March"
	elif [ "$1" = 04 ]||[ "$1" = 4 ]; then
		echo "April"
	elif [ "$1" = 05 ]||[ "$1" = 5 ]; then
		echo "May"
	elif [ "$1" = 06 ]||[ "$1" = 6 ]; then
		echo "June"
	elif [ "$1" = 07 ]||[ "$1" = 7 ]; then
		echo "July"
	elif [ "$1" = 08 ]||[ "$1" = 8 ]; then
		echo "August"
	elif [ "$1" = 09 ]||[ "$1" = 9 ]; then
		echo "September"
	elif [ "$1" = 10 ]; then
		echo "October"
	elif [ "$1" = 11 ]; then
		echo "November"
	elif [ "$1" = 12 ]; then
		echo "December"
	else
		echo "ERROR: Invalid month number"
	fi
}

install_wifi_resume_script () {
	echo "Installing WiFi Resume Script..."
	sudo rm /usr/local/bin/wifi-restart
	sudo touch /usr/local/bin/wifi-restart
	sudo chmod +x /usr/local/bin/wifi-restart
	echo -e '#!/bin/bash\nkillall nm-applet\ngksu service network-manager restart\nnm-applet\nexit' | sudo tee /usr/local/bin/wifi-restart
	sudo rm /usr/local/bin/wifi.png
	sudo cp "${f}/wifi.png" /usr/local/bin/
	sudo rm /usr/share/applications/wifirestart.desktop
	echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=WiFi Restart\nComment=Restarts the nm-applet and network-manager service.\nExec=/usr/local/bin/wifi-restart\nIcon=/usr/local/bin/wifi.png\nTerminal=false\nType=Application\nCategories=Utilities;" | sudo tee /usr/share/applications/wifirestart.desktop
}

install_google_talk_plugin () {
	## Install google-talk plugin
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget -q http://dl.google.com/linux/direct/google-talkplugin_current_${VER}.deb -O ~/Downloads/google-talkplugin_current_${VER}.deb
	sudo dpkg -i ~/Downloads/google-talkplugin_current_${VER}.deb
	rm ~/Downloads/google-talkplugin_current_${VER}.deb
}

install_google_chrome () {
	## Install google chrome
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget -q http://dl.google.com/linux/direct/google-chrome-stable_current_${VER}.deb -O ~/Downloads/google-chrome-stable_current_${VER}.deb
	sudo dpkg -i ~/Downloads/google-chrome-stable_current_${VER}.deb
	rm ~/Downloads/google-chrome-stable_current_${VER}.deb
}

install_google_earth () {
	## Install google earth
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget -q http://dl.google.com/linux/direct/google-earth-stable_current_${VER}.deb -O ~/Downloads/google-earth-stable_current_${VER}.deb
	sudo dpkg -i ~/Downloads/google-earth-stable_current_${VER}.deb
	rm ~/Downloads/google-earth-stable_current_${VER}.deb
}

install_google_music_manager () {
	## Install google music manager
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget http://dl.google.com/linux/direct/google-musicmanager-beta_current_${VER}.deb -O ~/Downloads/google-musicmanager-beta_current_${VER}.deb
	sudo dpkg -i ~/Downloads/google-musicmanager-beta_current_${VER}.deb
	rm ~/Downloads/google-musicmanager-beta_current_${VER}.deb
}

install_dropbox () {
	## Install dropbox
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget -q http://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.8_${VER}.deb -O ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
	sudo dpkg -i ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
	rm ~/Downloads/nautilus-dropbox_0.6.8_${VER}.deb
}

install_minecraft () {
	## Downloads and Installs Minecraft with an Entry in the Games applications folder
	sudo mkdir /usr/local/bin/minecraft/
	sudo wget -q http://www.minecraft.net/download/minecraft.jar -O /usr/local/bin/minecraft/minecraft.jar
	wget -q http://kaishinlab.com/wp-content/uploads/files/minecraft.zip -O ~/Downloads/minecraft_icons.zip
	mkdir ~/Downloads/minecraft_icons
	unzip ~/Downloads/minecraft_icons.zip -d ~/Downloads/minecraft_icons/
	sudo cp ~/Downloads/minecraft_icons/minecraft/PNG/Minecraft.png /usr/local/bin/minecraft/
	rm ~/Downloads/minecraft_icons.zip
	rm -rf /~Downloads/minecraft_icons/
	echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Minecraft\nComment=Minecraft is a game about placing blocks to build anything you can imagine.\nExec=java -Xmx1024M -Xms512M -cp /usr/local/bin/minecraft/minecraft.jar net.minecraft.LauncherFrame\nIcon=/usr/local/bin/minecraft/Minecraft.png\nTerminal=false\nType=Application\nCategories=Games;" | sudo tee /usr/share/applications/minecraft.desktop
}

install_truecrypt () {
	## Downloads and Installs Truecrypt
	echo "Installing Truecrypt..."
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="x64"
	else
		VER="x86"
	fi
	wget -q http://www.truecrypt.org/download/truecrypt-7.0a-linux-${VER}.tar.gz -O ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz
	tar -zxvf ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz -C ~/Downloads/Truecrypt/
	rm ~/Downloads/truecrypt-7.0a-linux-${VER}.tar.gz
	sudo ~/Downloads/Truecrypt/truecrypt-7.0a-setup-${VER}
	rm -rf ~/Downloads/Truecrypt/
}

install_huludesktop () {
	## Install Hulu Desktop
	VER=""
	if (uname -a | grep 'x86_64'); then
		VER="amd64"
	else
		VER="i386"
	fi
	wget -q http://download.hulu.com/huludesktop_${VER}.deb -O ~/Downloads/huludesktop_${VER}.deb
	sudo dpkg -i ~/Downloads/huludesktop_${VER}.deb
	rm ~/Downloads/huludesktop_${VER}.deb
}

install_gedit_plugins () {
	## Downloads and Installs Gedit Plugins
	
	## Smart Highlighting
	VERSH="2.0.0"
	wget -q http://smart-highlighting-gedit.googlecode.com/files/smart_highlighting-${VERSH}.tar.gz -O ~/Downloads/smart_highlighting-${VERSH}.tar.gz
	tar -zxvf ~/Downloads/smart_highlighting-${VERSH}.tar.gz -C ~/Downloads/
	sudo sh ~/Downloads/smart_highlighting-${VERSH}/install.sh
	rm -rf ~/Downloads/smart_highlighting-${VERSH}/
	rm ~/Downloads/smart_highlighting-${VERSH}.tar.gz
	
	## Pair Char Completion
	VERPCC="1.0.5"
	wget -q http://gedit-pair-char-autocomplete.googlecode.com/files/gedit-pair-char-completion-${VERPCC}.tar.gz -O ~/Downloads/gedit-pair-char-completion-${VERPCC}.tar.gz
	tar -zxvf ~/Downloads/gedit-pair-char-completion-${VERPCC}.tar.gz -C ~/Downloads/
	sudo sh ~/Downloads/gedit-pair-char-completion-${VERPCC}/install.sh
	rm -rf ~/Downloads/gedit-pair-char-completion-${VERPCC}/
	rm ~/Downloads/gedit-pair-char-completion.tar.gz
}

install_apps_no_repos () {
	## Installs all of the applications EXCEPT the ones accessable from the repositories installed before
	qq_update
	
	sudo apt-get -qqy install gimp ubuntu-restricted-extras compizconfig-settings-manager compiz-fusion-plugins-extra chromium-browser lo-menubar conky sun-java6-jre sun-java6-plugin sun-java6-fonts git samba filezilla googlecl pithos gedit-plugins
	
	echo "Asking for you to decide which version of java to use..."
	sudo update-alternatives --config java
}

install_apps_yes_repos () {
	## Installs all of the applications INCLUDING the ones accessable from the repositories installed before
	qq_update
	
	sudo apt-get -qqy install faenza-icon-theme thunderbird gimp gimp-data gimp-plugin-registry gimp-data-extras ubuntu-restricted-extras compizconfig-settings-manager compiz-fusion-plugins-extra google-chrome-stable lo-menubar conky unity-lens-gwibber wine1.3 winetricks spotify-client-qt spotify-client-gnome-support skype opera sun-java6-jre sun-java6-plugin sun-java6-fonts git ubuntu-tweak samba xbmc filezilla openshot openshot-doc googlecl mongodb-10gen lookit super-boot-manager pithos gedit-plugins
	
	echo "Asking for you to decide which version of java to use..."
	sudo update-alternatives --config java
}

install_super_os_repo () {
	## Install super os repo
	wget -q http://hacktolive.org/download/super-os-repo-installer.deb -O ~/Downloads/super-os-repo-installer.deb
	sudo dpkg -i ~/Downloads/super-os-repo-installer.deb
	rm ~/Downloads/super-os-repo-installer.deb
}

install_repositories () {
	sudo add-apt-repository ppa:tiheum/equinox
	sudo add-apt-repository ppa:mozillateam/thunderbird-stable
	sudo add-apt-repository ppa:matthaeus123/mrw-gimp-svn
	sudo add-apt-repository ppa:gwibber-team/ppa
	sudo add-apt-repository ppa:ubuntu-wine/ppa
	sudo add-apt-repository ppa:git-core/ppa
	sudo add-apt-repository ppa:tualatrix/ppa
	sudo add-apt-repository ppa:team-xbmc/unstable
	sudo add-apt-repository ppa:jonoomph/openshot-edge
	sudo add-apt-repository ppa:lookit/ppa
	sudo add-apt-repository ppa:ingalex/super-boot-manager
	sudo add-apt-repository ppa:kevin-mehall/pithos-daily
	
	sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
	
	## Enable Canonical Repositories
	sudo sed -i -e "s/# deb http:\/\/archive.canonical.com\/ubuntu/deb http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list
	sudo sed -i -e "s/# deb-src http:\/\/archive.canonical.com\/ubuntu/deb-src http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list
	
	## Spotify Repository
	echo -e "\n## Spotify Repository\ndeb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify-ppa.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
	
	## Opera Repository
	echo -e "\n## Opera Repository\ndeb http://deb.opera.com/opera/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-ppa.list
	wget -q -O - http://deb.opera.com/archive.key | sudo apt-key add -
	
	## MongoDB Repository
	echo -e "\n## MongoDB Repository\ndeb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb-ppa.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
	
	qq_update
}

install_vaioz_app () {
	## Installs the Vaio Z Script
	## http://global-social.net/tiki-view_blog.php?blogId=3
	echo "Installing Vaio Z App"
	sudo wget -NP /usr/local/bin/ http://global-social.net/files/sony-VGN-Zseries-janitor
	sudo chmod 0755 /usr/local/bin/sony-VGN-Zseries-janitor
}

remove_evolution_indicator () {
	sudo apt-get remove evolution-indicator
}

install_node () {
	read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM
	echo ""
	
	if [ "$CONFIRM" = n ]; then
		echo "Quiting..."
	else
		sudo apt-get -qqy install g++ curl libssl-dev apache2-utils
	
		wget -q http://nodejs.org/#download -O ~/Downloads/node-index.html
		VALLSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(stable\)" index.html`
		VALLUNSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(unstable\)" index.html`
		
		## Date for Stable Version
		VSYEAR=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 1`
		VSMONTH=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 2`
		VSDAY=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 3`
		VSDAYS=`echo $((VSDAY-0))`
		
		VSMONTHW=`get_month "${VSMONTH}"`
		
		## Date for Unstable Version
		VUYEAR=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 1`
		VUMONTH=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 2`
		VUDAY=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 3`
		VUDAYS=`echo $((VUDAY-0))`
		
		VUMONTHW=`get_month "${VUMONTH}"`
		
		## Version Numbers of Node.js
		VSTABLE=`echo "${VALLSTABLE}"|cut -d " " -f 2`
		VUNSTABLE=`echo "${VALLUNSTABLE}"|cut -d " " -f 2`
		
		rm ~/Downloads/node-index.html
		
		echo "Current Versions of Node.js:"
		echo "\t${VSTABLE}\t\tBuild Date: ${VSMONTHW} ${VSDAYS}, ${VSYEAR}"
		echo "\t${VUNSTABLE}\t\tBuild Date: ${VUMONTHW} ${VUDAYS}, ${VUYEAR}"
		echo ""
		
		VINSTALL=""
		
		read -p "Choose which Node.js version you wish to install (stable (${VSTABLE}) = 1, unstable (${VUNSTABLE}) = 2): " VNODE
		if [ "$VNODE" = 1 ]; then
			VINSTALL="${VSTABLES}"
		elif [ "$VNODE" = 2 ]; then
			VINSTALL="${VUNSTABLES}"
		else
			echo "Invalid Choice!"
			echo ""
			install_node
		fi
		
		echo "Installing Node.js..."
		usr_local_permissions
		wget -q http://nodejs.org/dist/node-${VINSTALL}.tar.gz -O ~/Downloads/node-${VINSTALL}.tar.gz
		mkdir ~/Node/
		tar -zxvf ~/Downloads/node-${VINSTALL}.tar.gz -C ~/Node/
		rm ~/Downloads/node-${VINSTALL}.tar.gz

		sudo apt-get -qqy install cmake curl

		cd ~/Node/node-${VINSTALL}/
		make -f Makefile.cmake -s
		make -f Makefile.cmake -s install
		rm -rf ~/Node/node-${VINSTALL}/
		cd ~
		
		echo "Installing npm..."
		curl http://npmjs.org/install.sh | clean=yes sh
	fi
}

install_nowtable () {
	cd ~/Documents/
	git clone git@github.com:khwang/Nowtable.git
	cd ~/Documents/Nowtable/
	npm install express
	npm install ejs
	npm install connect-form
	npm install formidable
	npm install now
}

##THIS IS THE COOL MAC PART FOR COOL PEOPLE

install_homebrew () {
	if [ -d /usr/local/.git ]; then
		echo "Homebrew is already installed"
	else 
		/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
	fi
}

choose_what_to_do () {
	while true; do
		echo "q = Quit"
		echo "d = sudo apt-get -qq update"
		echo "g = sudo apt-get -qqy upgrade"
		echo "1 = Install Repositories"
		echo "2 = Change /usr/local Permissions"
		echo "3 = Install Google Talk Plugin"
		echo "4 = Install Google Chrome"
		echo "5 = Install Google Earth"
		echo "6 = Install Dropbox"
		echo "7 = Install Minecraft"
		echo "8 = Install Gedit Plugins (not in gedit-plugins package)"
		echo "9 = Install Apps without Repos"
		echo "10 = Install Apps with Repos"
		echo "11 = Install Vaio Z Janitor Script"
		echo "12 = Remove Evolution Indicator"
		echo "13 = Install Node.js"
		echo "14 = Install Nowtable"
		echo "15 = Install Google Music Manager"
		echo "16 = Install WiFi Restart Script"
		echo "17 = Install SuperOS Repository (WARNING: Has conflicting packages!)"
		echo "18 = Install Truecrypt"
		echo "19 = Install Hulu Desktop"
		echo "666 = DO EVERYTHING!"
		echo ""
		read -p "Choose command: " REPLY
		if [ "$REPLY" = q ]; then
			echo "Quiting..."
			break
		elif [ "$REPLY" = d ]; then
			qq_update
		elif [ "$REPLY" = g ]; then
			qqy_upgrade
		elif [ "$REPLY" = 1 ]; then
			install_repositories
		elif [ "$REPLY" = 2 ]; then
			usr_local_permissions
		elif [ "$REPLY" = 3 ]; then
			install_google_talk_plugin
		elif [ "$REPLY" = 4 ]; then
			install_google_chrome
		elif [ "$REPLY" = 5 ]; then
			install_google_earth
		elif [ "$REPLY" = 6 ]; then
			install_dropbox
		elif [ "$REPLY" = 7 ]; then
			install_minecraft
		elif [ "$REPLY" = 8 ]; then
			install_gedit_plugins
		elif [ "$REPLY" = 9 ]; then
			install_apps_no_repos
		elif [ "$REPLY" = 10 ]; then
			install_apps_yes_repos
		elif [ "$REPLY" = 11 ]; then
			install_vaioz_app
		elif [ "$REPLY" = 12 ]; then
			remove_evolution_indicator
		elif [ "$REPLY" = 13 ]; then
			install_node
		elif [ "$REPLY" = 14 ]; then
			install_nowtable
		elif [ "$REPLY" = 15 ]; then
			install_google_music_manager
		elif [ "$REPLY" = 16 ]; then
			install_wifi_resume_script
		elif [ "$REPLY" = 17 ]; then
			install_super_os_repo
		elif [ "$REPLY" = 18 ]; then
			install_truecrypt
		elif [ "$REPLY" = 19 ]; then
			install_huludesktop
		elif [ "$REPLY" = 20]; then
			modify_aliases
		elif [ "$REPLY" = 666 ]; then
			usr_local_permissions
			qq_update
			install_repositories
			install_google_talk_plugin
			install_google_chrome
			install_google_earth
			install_google_music_manager
			install_dropbox
			install_minecraft
			install_gedit_plugins
			qq_update
			install_apps_yes_repos
			qq_update
			install_vaioz_app
			remove_evolution_indicator
			qq_update
			install_node
			install_nowtable
			install_wifi_resume_script
			qq_update
			qqy_upgrade
		else
			echo "Invalid Choice!"
		fi
		echo ""
	done
}

mac_choose_what_to_do () {
	echo "Note: This probably doesn't all work yet"
	while true; do
		echo "q = Quit"
		echo "d = sudo apt-get -qq update"
		echo "g = sudo apt-get -qqy upgrade"
		echo "1 = Install Homebrew (pretty damn important)"
		echo "2 = Change /usr/local Permissions"
		echo "3 = Install Google Talk Plugin"
		echo "4 = Install Google Chrome"
		echo "5 = Install Google Earth"
		echo "6 = Install Dropbox"
		echo "7 = Install Minecraft"
		echo "8 = Install Gedit Plugins (not in gedit-plugins package)"
		echo "9 = Install Apps without Repos"
		echo "10 = Install Apps with Repos"
		echo "11 = Install Vaio Z Janitor Script"
		echo "12 = Remove Evolution Indicator"
		echo "13 = Install Node.js"
		echo "14 = Install Nowtable"
		echo "15 = Install Google Music Manager"
		echo "16 = Install WiFi Restart Script"
		echo "17 = Install SuperOS Repository (WARNING: Has conflicting packages!)"
		echo "18 = Install Truecrypt"
		echo "19 = Install Hulu Desktop"
		echo "20 = Modify Aliases"
		echo "666 = DO EVERYTHING!"
		read -p "Choose command: " REPLY
		if [ "$REPLY" = q ]; then
			echo "Quiting..."
			break
		elif [ "$REPLY" = d ]; then
			qq_update
		elif [ "$REPLY" = g ]; then
			qqy_upgrade
		elif [ "$REPLY" = 1 ]; then
			install_homebrew
		elif [ "$REPLY" = 2 ]; then
			usr_local_permissions
		elif [ "$REPLY" = 3 ]; then
			install_google_talk_plugin
		elif [ "$REPLY" = 4 ]; then
			install_google_chrome
		elif [ "$REPLY" = 5 ]; then
			install_google_earth
		elif [ "$REPLY" = 6 ]; then
			install_dropbox
		elif [ "$REPLY" = 7 ]; then
			install_minecraft
		elif [ "$REPLY" = 8 ]; then
			install_gedit_plugins
		elif [ "$REPLY" = 9 ]; then
			install_apps_no_repos
		elif [ "$REPLY" = 10 ]; then
			install_apps_yes_repos
		elif [ "$REPLY" = 11 ]; then
			install_vaioz_app
		elif [ "$REPLY" = 12 ]; then
			remove_evolution_indicator
		elif [ "$REPLY" = 13 ]; then
			install_node
		elif [ "$REPLY" = 14 ]; then
			install_nowtable
		elif [ "$REPLY" = 15 ]; then
			install_google_music_manager
		elif [ "$REPLY" = 16 ]; then
			install_wifi_resume_script
		elif [ "$REPLY" = 17 ]; then
			install_super_os_repo
		elif [ "$REPLY" = 18 ]; then
			install_truecrypt
		elif [ "$REPLY" = 19 ]; then
			install_huludesktop
		elif [ "$REPLY" = 20 ]; then
			modify_aliases
		elif [ "$REPLY" = 666 ]; then
			install_homebrew
			usr_local_permissions
			qq_update
			install_google_talk_plugin
			install_google_chrome
			install_google_earth
			install_google_music_manager
			install_dropbox
			install_minecraft
			install_gedit_plugins
			qq_update
			install_apps_yes_repos
			qq_update
			install_vaioz_app
			remove_evolution_indicator
			qq_update
			install_node
			install_nowtable
			install_wifi_resume_script
			qq_update
			qqy_upgrade
		else
			echo "Invalid Choice!"
		fi
		echo ""
	done
}


##MODIFYING ALIASES
modify_aliases () {
	echo "---------------------------"
	echo "Modify your aliases here!"
	echo "---------------------------"
	touch ~/.post-aliases
	while true; do
		echo "q = Quit"
		echo "1 = Fix dot navigation"
		read -p "Choose command: " REPLY
		if [ "$REPLY" = q ]; then
			echo "Quitting..."
			break
		elif [ "$REPLY" = 1 ]; then
			FOUND=`egrep "alias \.\.=" ~/.post-aliases`
			if [ '$FOUND' ]; then
				echo "DERP"
				echo $FOUND
				REPLACE="alias ..=\"cd ..\""
				echo $REPLACE
				sed "s/alias herp=derp/DICKS/g" ~/.post-aliases
			else 
				echo -e "alias ..=\"cd ..\"" | tee -a ~/.post-aliases
			fi
		else 
			echo "Invalid choice"
		fi
	done
}

determine_OS

if [ "$platform" = MACOSX ]; then
	mac_choose_what_to_do
elif [ "$platform" = Linux ]; then
	choose_what_to_do
else
	echo "Sorry bud but your OS sucks"
fi
