check_homebrew
check_wget
check_app "Steam"

#wget http://www.dropbox.com/downloading?os=lnx -O ~/Downloads/dropbox-index.html
#VALLSTABLE=`egrep -o "nautilus-dropbox_[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*_${VER}\.deb" ~/Downloads/dropbox-index.html`
#echo "${VALLSTABLE}"
#VERNUM=`echo "${VALLSTABLE}"|cut -d "_" -f 2`

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then

			wget http://cdn.store.steampowered.com/public/client/installer/steam.dmg -O ~/Downloads/Steam.dmg
			yes | hdiutil mount -quiet ~/Downloads/Steam.dmg
			cp -R "/Volumes/Steam/Steam.app" /Applications
			hdiutil unmount -quiet "/Volumes/Steam"
			rm ~/Downloads/Steam.dmg
		else 
			echo "You already have Steam installed."
		fi
	else 
		echo "You should install wget first..."
	fi
else
	echo "You should install Homebrew first..."
fi