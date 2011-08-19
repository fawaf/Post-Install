check_homebrew
check_wget
check_app "Google Chrome"

#I'm pretty sure this always installs the latest version.
if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then
			wget -q http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg -O ~/Downloads/GoogleChrome.dmg
			hdiutil mount -quiet ~/Downloads/GoogleChrome.dmg
			cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
			hdiutil unmount -quiet "/Volumes/Google Chrome"
			rm ~/Downloads/GoogleChrome.dmg
		else 
			echo "You already have Google Chrome"
		fi
	else
		echo "You should install wget first."
	fi
else
	echo "You should really install Homebrew first!"
fi