check_homebrew
check_wget
check_app "Sublimezzz"

#wget http://www.dropbox.com/downloading?os=lnx -O ~/Downloads/dropbox-index.html
#VALLSTABLE=`egrep -o "nautilus-dropbox_[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*_${VER}\.deb" ~/Downloads/dropbox-index.html`
#echo "${VALLSTABLE}"
#VERNUM=`echo "${VALLSTABLE}"|cut -d "_" -f 2`

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then
			wget http://www.sublimetext.com/2 -O ~/Downloads/sublime-index.html
			VALLSTABLE=`egrep -o "Beta</a> is [0-9]*" ~/Downloads/sublime-index.html | tail -1`
			echo ${VALLSTABLE}
			wget "http://c758482.r82.cf2.rackcdn.com/Sublime Text 2 Build ${VALLSTABLE}.dmg" -O ~/Downloads/Sublime.dmg
			#hdiutil mount -quiet ~/Downloads/LibreOffice.dmg
			#cp -R "/Volumes/LibreOffice/LibreOffice.app" /Applications
			#hdiutil unmount -quiet "/Volumes/LibreOffice"
			#rm ~/Downloads/LibreOffice.dmg
			#rm ~/Downloads/libreoffice-index.html
		else 
			echo "You already have Sublime installed."
		fi
	else 
		echo "You should install wget first..."
	fi
else
	echo "You should install Homebrew first..."
fi