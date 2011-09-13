#!/bin/bash
# http://www.dropbox.com/
# Install dropbox

determine_bitage
VER=$RETURN

wget http://www.dropbox.com/downloading?os=lnx -O ~/Downloads/dropbox-index.html

VALLSTABLE=`egrep -o "nautilus-dropbox_[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*_${VER}\.deb" ~/Downloads/dropbox-index.html`
echo "${VALLSTABLE}"
VERNUM=`echo "${VALLSTABLE}"|cut -d "_" -f 2`

rm ~/Downloads/dropbox-index.html

echo "Installing Dropbox v${VERNUM}..."

wget http://www.dropbox.com/download?dl=packages/nautilus-dropbox_${VERNUM}_${VER}.deb -O ~/Downloads/nautilus-dropbox_${VERNUM}_${VER}.deb
sudo dpkg -i ~/Downloads/nautilus-dropbox_${VERNUM}_${VER}.deb
rm ~/Downloads/nautilus-dropbox_${VERNUM}_${VER}.deb
