# requires brew
# requires gcc
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
source ~/.bash_profile
brew install libksba
rvm install 1.9.3 --default
