check_homebrew

if [ "$HAVEHOMEBREW" == 1 ]; then
	echo "You already have Homebrew!"
	return
else 
	echo "Installing Homebrew!"
	/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
fi