check_homebrew
check_wget
check_app "Adium"

#Todo: Have it install the latest version.
if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0]; then
			wget -q http://download.adium.im/Adium_1.4.2.dmg -O ~/Downloads/Adium.dmg
			hdiutil mount -quiet ~/Downloads/Adium.dmg
			cp -R "/Volumes/Adium 1.4.2/Adium.app" /Applications
			hdiutil unmount -quiet "/Volumes/Adium 1.4.2"
			rm ~/Downloads/Adium.dmg
		else 
			echo "You already have Adium!"
		fi
	else
		echo "You should install wget!"
	fi
else
	echo "You should install Homebrew first!"
fi