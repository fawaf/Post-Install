check_homebrew

if [ "$HAVEHOMEBREW" == 1 ]; then
	brew install wget
else
	echo "You should install Homebrew first!"
fi


