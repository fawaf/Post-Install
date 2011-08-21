check_homebrew
check_wget
check_app Dropbox
#Todo: Have it install the LATEST version.

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then
			wget -q http://cdn.dropbox.com/Dropbox%201.1.35.dmg -O ~/Downloads/Dropbox.dmg
			hdiutil mount -quiet ~/Downloads/Dropbox.dmg
			cp -R "/Volumes/Dropbox Install/Dropbox.app" /Applications
			hdiutil unmount -quiet "/Volumes/Dropbox Install"
			rm ~/Downloads/Dropbox.dmg
		else 
			echo "You already have Dropbox installed"
		fi
	else
		echo "You should install wget!"
	fi
else
	echo "You need Homebrew first!!"
fi