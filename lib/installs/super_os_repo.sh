#!/bin/bash
# Install super os repo
wget -q http://hacktolive.org/download/super-os-repo-installer.deb -O ~/Downloads/super-os-repo-installer.deb
sudo dpkg -i ~/Downloads/super-os-repo-installer.deb
rm ~/Downloads/super-os-repo-installer.deb
