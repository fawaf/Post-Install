# Stub description

echo "Installing WiFi Resume Script..."

$ROOT/lib/tools/usr_local_permissions.sh

if [ -e "/usr/local/bin/wifi-restart" ]; then
	sudo rm /usr/local/bin/wifi-restart
fi

sudo touch /usr/local/bin/wifi-restart
sudo chmod +x /usr/local/bin/wifi-restart
echo -e '#!/bin/bash\nkillall nm-applet\ngksu service network-manager restart\nnm-applet\nexit' | sudo tee /usr/local/bin/wifi-restart

if [ -e "/usr/local/bin/wifi.png" ]; then
	sudo rm /usr/local/bin/wifi.png
fi

sudo cp "${ROOT}/config/wifi-resume-script/wifi.png" /usr/local/bin/

if [ -e "/usr/share/applications/wifirestart.desktop" ]; then
	sudo rm /usr/share/applications/wifirestart.desktop
fi

echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=WiFi Restart\nComment=Restarts the nm-applet and network-manager service.\nExec=/usr/local/bin/wifi-restart\nIcon=/usr/local/bin/wifi.png\nTerminal=false\nType=Application\nCategories=Utilities;" | sudo tee /usr/share/applications/wifirestart.desktop
