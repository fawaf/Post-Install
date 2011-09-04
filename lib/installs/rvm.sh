sudo apt-get install curl git
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bashrc
source ~/.bashrc
rvm install 1.9.2
rvm use --default 1.9.2
