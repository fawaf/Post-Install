check_homebrew

if [ $* == 1 ]; then
	return 1
fi

brew install wget
