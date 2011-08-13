read -p "Currently Executing as User: \"${USER}\". Is this correct (y/n)? " CONFIRM
echo ""

if [ "$CONFIRM" = n ]; then
  echo "Quiting..."
else
  sudo apt-get -qqy install g++ curl libssl-dev apache2-utils

  wget -q http://nodejs.org/#download -O ~/Downloads/node-index.html
  VALLSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(stable\)" index.html`
  VALLUNSTABLE=`egrep -o "[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9}\.[[:digit:]]{0,9}[[:digit:]]{0,9} v[[:digit:]]{0,9}*\.[[:digit:]]{0,9}*\.[[:digit:]]{0,9}* \(unstable\)" index.html`

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
  echo "\t${VSTABLE}\t\tBuild Date: ${VSMONTHW} ${VSDAYS}, ${VSYEAR}"
  echo "\t${VUNSTABLE}\t\tBuild Date: ${VUMONTHW} ${VUDAYS}, ${VUYEAR}"
  echo ""

  VINSTALL=""

  read -p "Choose which Node.js version you wish to install (stable (${VSTABLE}) = 1, unstable (${VUNSTABLE}) = 2): " VNODE
  if [ "$VNODE" = 1 ]; then
    VINSTALL="${VSTABLES}"
  elif [ "$VNODE" = 2 ]; then
    VINSTALL="${VUNSTABLES}"
  else
    echo "Invalid Choice!"
    echo ""
    install_node
  fi

  echo "Installing Node.js..."
  usr_local_permissions
  wget -q http://nodejs.org/dist/node-${VINSTALL}.tar.gz -O ~/Downloads/node-${VINSTALL}.tar.gz
  mkdir ~/Node/
  tar -zxvf ~/Downloads/node-${VINSTALL}.tar.gz -C ~/Node/
  rm ~/Downloads/node-${VINSTALL}.tar.gz

  sudo apt-get -qqy install cmake curl

  cd ~/Node/node-${VINSTALL}/
  make -f Makefile.cmake -s
  make -f Makefile.cmake -s install
  rm -rf ~/Node/node-${VINSTALL}/
  cd ~

  echo "Installing npm..."
  curl http://npmjs.org/install.sh | clean=yes sh
fi
