check_homebrew
check_wget
check_app "LibreOffice 3.3"
#todo: Have it install the latest version always.

if [ "$HAVEHOMEBREW" == 1 ]; then
	if [ "$HAVEWGET" == 1 ]; then
		if [ "$HAVEAPP" == 0 ]; then
			wget -q http://download.documentfoundation.org/libreoffice/stable/3.3.3/mac/x86/LibO_3.3.3_MacOS_x86_install_en-US.dmg -O ~/Downloads/LibreOffice.dmg
			hdiutil mount -quiet ~/Downloads/LibreOffice.dmg
			cp -R "/Volumes/LibreOffice 3.3/LibreOffice.app" /Applications
			hdiutil unmount -quiet "/Volumes/LibreOffice 3.3"
			rm ~/Downloads/LibreOffice.dmg
		else 
			echo "You already have LibreOffice installed."
		fi
	else 
		echo "You should install wget first..."
	fi
else
	echo "You should install Homebrew first..."
fi