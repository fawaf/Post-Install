check_homebrew

#I'm pretty sure this always installs the latest version.
if [ "$HAVEHOMEBREW" == 1 ]; then
	wget -q http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg -O ~/Downloads/GoogleChrome.dmg
	hdiutil mount -quiet ~/Downloads/GoogleChrome.dmg
	cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
	hdiutil unmount -quiet "/Volumes/Google Chrome"
	rm ~/Downloads/GoogleChrome.dmg
else
	echo "You should really install Homebrew first!"
fi