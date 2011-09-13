#!/bin/bash
# http://nodejs.org/
# Installs Node.js

read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM
echo ""

if [ "$CONFIRM" = n ]; then
  echo "Quiting..."
else
  sudo apt-get -qqy install g++ curl libssl-dev apache2-utils cmake curl

  wget http://nodejs.org/#download -O ~/Downloads/node-index.html
  VALLSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(stable\)" ~/Downloads/node-index.html`
  VALLUNSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(unstable\)" ~/Downloads/node-index.html`

  ## Date for Stable Version
  VSYEAR=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 1`
  VSMONTH=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 2`
  VSDAY=`echo "${VALLSTABLE}"|cut -d " " -f 1|cut -d "." -f 3`
  VSDAYS=`echo $((VSDAY-0))`

  VSMONTHW=`get_month "${VSMONTH}"`

  ## Date for Unstable Version
  VUYEAR=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 1`
  VUMONTH=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 2`
  VUDAY=`echo "${VALLUNSTABLE}"|cut -d " " -f 1|cut -d "." -f 3`
  VUDAYS=`echo $((VUDAY-0))`

  VUMONTHW=`get_month "${VUMONTH}"`

  ## Version Numbers of Node.js
  VSTABLE=`echo "${VALLSTABLE}"|cut -d " " -f 2`
  VUNSTABLE=`echo "${VALLUNSTABLE}"|cut -d " " -f 2`

  rm ~/Downloads/node-index.html

  echo "Current Versions of Node.js:"
  echo -e "\t${VSTABLE}\t\tBuild Date: ${VSMONTHW} ${VSDAYS}, ${VSYEAR}"
  echo -e "\t${VUNSTABLE}\t\tBuild Date: ${VUMONTHW} ${VUDAYS}, ${VUYEAR}"
  echo ""

  VINSTALL=""
  VVER=""

  while true; do
  read -p "Choose which Node.js version you wish to install (stable (${VSTABLE}) = 1, unstable (${VUNSTABLE}) = 2): " VNODE
  if [ "$VNODE" = 1 ]; then
    VINSTALL="node-${VSTABLE}"
    VVER="${VSTABLE}"
    break
  elif [ "$VNODE" = 2 ]; then
    VINSTALL="${VUNSTABLE}/node-${VUNSTABLE}"
    VVER="${VUNSTABLE}"
    break
  else
    echo ""
    echo "Invalid Choice!"
    echo ""
  fi
  done

  echo "Installing Node.js..."
  $ROOT/lib/tools/usr_local_permissions.sh
  
  wget http://nodejs.org/dist/${VINSTALL}.tar.gz -O ~/Downloads/node-${VVER}.tar.gz
  mkdir ~/Node/
  tar -xvzf ~/Downloads/node-${VVER}.tar.gz -C ~/Node/
  rm ~/Downloads/node-${VVER}.tar.gz

  cd ~/Node/node-${VVER}/
  ./configure
  make
  make install
  cd ~
  rm -rf ~/Node/node-${VVER}/

  echo "Installing npm..."
  curl http://npmjs.org/install.sh | clean=yes sh
fi
