#!/bin/bash
# Install Hulu Desktop
determine_bitage
VER=$RETURN
wget -q http://download.hulu.com/huludesktop_${VER}.deb -O ~/Downloads/huludesktop_${VER}.deb
sudo dpkg -i ~/Downloads/huludesktop_${VER}.deb
rm ~/Downloads/huludesktop_${VER}.deb
