check_homebrew

if [ "$HAVEHOMEBREW" == 1 ]; then
	echo "You already have Homebrew!"
	return
else 
	echo "Installing Homebrew!"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi