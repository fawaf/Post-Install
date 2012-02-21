#!/bin/bash
# http://nodejs.org/
# Installs Node.js

$logfile="/dev/null"

read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM
echo ""

if [ "$CONFIRM" = n ]; then
  echo "Quiting..."
else
	echo "Install Dependencies..."
  sudo apt-get -qqy install g++ curl libssl-dev apache2-utils cmake curl &> $logfile

  wget http://nodejs.org/#download -O ~/Downloads/node-index.html &> $logfile
  VALLSTABLE=`egrep -o "<p class=\"version\">.*<\/p>" ~/Downloads/node-index.html` &> $logfile

  ## Version Numbers of Node.js
  VSTABLE=`echo "${VALLSTABLE}"|cut -d ">" -f 2` &> $logfile
  VSTABLE=`echo "${VSTABLE}"|cut -d "<" -f 1` &> $logfile

  rm ~/Downloads/node-index.html &> $logfile

  VINSTALL=""
  VVER=""

  VINSTALL="node-${VSTABLE}"
  VVER="${VSTABLE}"

  $ROOT/lib/tools/usr_local_permissions.sh
	echo "Installing Node.js..."
  
  wget http://nodejs.org/dist/${VVER}/${VINSTALL}.tar.gz -O ~/Downloads/node-${VVER}.tar.gz &> $logfile
  mkdir ~/Node/ &> $logfile
  tar -xvzf ~/Downloads/node-${VVER}.tar.gz -C ~/Node/ &> $logfile
  rm ~/Downloads/node-${VVER}.tar.gz

  cd ~/Node/node-${VVER}/ &> $logfile
  ./configure &> $logfile
  make &> $logfile
  make install &> $logfile
  cd ~
  rm -rf ~/Node/

  echo "Installing npm..."
  curl http://npmjs.org/install.sh &> ~$logfile | clean=yes sh
fi

rm $logfile &> /dev/null