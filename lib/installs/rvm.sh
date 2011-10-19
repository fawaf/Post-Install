#!/bin/bash
# Ruby Version Manager
# RVM make installing multiple ruby interpreters / runtimes easy and consistent,
# it provides features such as gemsets that aren't typically supported out of the box on most ruby installs.
# http://beginrescueend.com/
#


sudo apt-get install curl git
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
source ~/.bashrc
rvm install 1.9.2
rvm use --default 1.9.2
