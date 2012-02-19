#!/bin/bash
# http://nodejs.org/
# Installs Node.js

read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM
echo ""

if [ "$CONFIRM" = n ]; then
  echo "Quiting..."
else
	echo "Install Dependencies..."
  sudo apt-get -qqy install g++ curl libssl-dev apache2-utils cmake curl &> /dev/null

  wget http://nodejs.org/#download -O ~/Downloads/node-index.html &> /dev/null
  VALLSTABLE=`egrep -o "<p class=\"version\">.*<\/p>" ~/Downloads/node-index.html` &> /dev/null

  ## Version Numbers of Node.js
  VSTABLE=`echo "${VALLSTABLE}"|cut -d ">" -f 2` &> /dev/null
  VSTABLE=`echo "${VSTABLE}"|cut -d "<" -f 1` &> /dev/null

  rm ~/Downloads/node-index.html &> /dev/null

  VINSTALL=""
  VVER=""

  VINSTALL="node-${VSTABLE}"
  VVER="${VSTABLE}"

  $ROOT/lib/tools/usr_local_permissions.sh
	echo "Installing Node.js..."
  
  wget http://nodejs.org/dist/${VVER}/${VINSTALL}.tar.gz -O ~/Downloads/node-${VVER}.tar.gz &> /dev/null
  mkdir ~/Node/ &> /dev/null
  tar -xvzf ~/Downloads/node-${VVER}.tar.gz -C ~/Node/ &> /dev/null
  rm ~/Downloads/node-${VVER}.tar.gz

  cd ~/Node/node-${VVER}/ &> /dev/null
  ./configure &> /dev/null
  make &> /dev/null
  make install &> /dev/null
  cd ~
  rm -rf ~/Node/

  echo "Installing npm..."
  curl http://npmjs.org/install.sh &> ~/dev/null | clean=yes sh
fi
