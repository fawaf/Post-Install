check_homebrew
check_wget

if [ "$HAVEHOMEBREW" = 1 ]; then
	if [ "$HAVEWGET" = 0 ]; then
		brew install wget
	else
		echo "You already have wget!"
	fi
else
	echo "You should install Homebrew first!"
fi