check_homebrew
check_wget
check_app "LibreOffice 3.3"
#todo: Have it install the latest version always.

#wget http://www.dropbox.com/downloading?os=lnx -O ~/Downloads/dropbox-index.html
#VALLSTABLE=`egrep -o "nautilus-dropbox_[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*_${VER}\.deb" ~/Downloads/dropbox-index.html`
#echo "${VALLSTABLE}"
#VERNUM=`echo "${VALLSTABLE}"|cut -d "_" -f 2`

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then

			wget http://download.documentfoundation.org/libreoffice/stable/ -O ~/Downloads/libreoffice-index.html
			VALLSTABLE=`egrep -o "[0-9]*\.[0-9]*\.[0-9]*" ~/Downloads/libreoffice-index.html | tail -1`
			echo ${VALLSTABLE}
			wget http://download.documentfoundation.org/libreoffice/stable/${VALLSTABLE}/mac/x86/LibO_${VALLSTABLE}_MacOS_x86_install_en-US.dmg -O ~/Downloads/LibreOffice.dmg
			hdiutil mount -quiet ~/Downloads/LibreOffice.dmg
			cp -R "/Volumes/LibreOffice 3.3/LibreOffice.app" /Applications
			hdiutil unmount -quiet "/Volumes/LibreOffice 3.3"
			rm ~/Downloads/LibreOffice.dmg
			rm ~/Downloads/libreoffice-index.html
		else 
			echo "You already have LibreOffice installed."
		fi
	else 
		echo "You should install wget first..."
	fi
else
	echo "You should install Homebrew first..."
fi