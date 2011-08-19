check_homebrew

#Todo: Have it install the latest version.
if [ "$HAVEHOMEBREW" == 1 ]; then
	wget -q http://download.adium.im/Adium_1.4.2.dmg -O ~/Downloads/Adium.dmg
	hdiutil mount -quiet ~/Downloads/Adium.dmg
	cp -R "/Volumes/Adium 1.4.2/Adium.app" /Applications
	hdiutil unmount -quiet "/Volumes/Adium 1.4.2"
	rm ~/Downloads/Adium.dmg
else
	echo "You should install Homebrew first!"
fi
