# Stubbed Description

read -p "Change Permissions of /usr/local to ${USER} (y/n): " REPLY
if [ "$REPLY" = n ]; then
  echo "Not Changing Permissions..."
else
  echo "setting /usr/local directory permissions to ${USER}..."
  sudo chown -R $USER /usr/local
fi
