# Stub description

echo "Installing WiFi Resume Script..."
sudo rm /usr/local/bin/wifi-restart
sudo touch /usr/local/bin/wifi-restart
sudo chmod +x /usr/local/bin/wifi-restart
echo -e '#!/bin/bash\nkillall nm-applet\ngksu service network-manager restart\nnm-applet\nexit' | sudo tee /usr/local/bin/wifi-restart
sudo rm /usr/local/bin/wifi.png
sudo cp "${f}/wifi.png" /usr/local/bin/
sudo rm /usr/share/applications/wifirestart.desktop
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=WiFi Restart\nComment=Restarts the nm-applet and network-manager service.\nExec=/usr/local/bin/wifi-restart\nIcon=/usr/local/bin/wifi.png\nTerminal=false\nType=Application\nCategories=Utilities;" | sudo tee /usr/share/applications/wifirestart.desktop
