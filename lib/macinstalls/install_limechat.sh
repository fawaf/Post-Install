check_homebrew
check_wget
check_app "Limechat"

#wget http://www.dropbox.com/downloading?os=lnx -O ~/Downloads/dropbox-index.html
#VALLSTABLE=`egrep -o "nautilus-dropbox_[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*_${VER}\.deb" ~/Downloads/dropbox-index.html`
#echo "${VALLSTABLE}"
#VERNUM=`echo "${VALLSTABLE}"|cut -d "_" -f 2`

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then

			wget http://limechat.net/mac -O ~/Downloads/limechat-index.html
			VALLSTABLE=`egrep -o LimeChat_[0-9]*\.[0-9]*\.tbz ~/Downloads/limechat-index.html | head -1`
			echo ${VALLSTABLE}
			wget http://cloud.github.com/downloads/psychs/limechat/${VALLSTABLE} -O ~/Downloads/LimeChat.tbz
			mkdir ~/Downloads/LimeChat
			tar -zxf ~/Downloads/LimeChat.tbz ~/Downloads/LimeChat
			cp -R "~/Downloads/LimeChat/LimeChat.app" /Applications
			rm -rf ~/Downloads/LimeChat
			rm ~/Downloads/LimeChat.tbz
			rm ~/Downloads/limechat-index.html


			#wget http://download.documentfoundation.org/libreoffice/stable/ -O ~/Downloads/libreoffice-index.html
			#VALLSTABLE=`egrep -o "[0-9]*\.[0-9]*\.[0-9]*" ~/Downloads/libreoffice-index.html | tail -1`
			#echo ${VALLSTABLE}
			#wget http://download.documentfoundation.org/libreoffice/stable/${VALLSTABLE}/mac/x86/LibO_${VALLSTABLE}_MacOS_x86_install_en-US.dmg -O ~/Downloads/LibreOffice.dmg
			#hdiutil mount -quiet ~/Downloads/LibreOffice.dmg
			#cp -R "/Volumes/LibreOffice 3.3/LibreOffice.app" /Applications
			#hdiutil unmount -quiet "/Volumes/LibreOffice 3.3"
			#rm ~/Downloads/LibreOffice.dmg
			#rm ~/Downloads/libreoffice-index.html
			rm ~/Downloads/limechat-index.html
		else 
			echo "You already have Limechat installed."
		fi
	else 
		echo "You should install wget first..."
	fi
else
	echo "You should install Homebrew first..."
fi