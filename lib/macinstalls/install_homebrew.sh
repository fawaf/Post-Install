CONTINUE = check_homebrew

if (CONTINUE == 0); then
	return
else 
	/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"