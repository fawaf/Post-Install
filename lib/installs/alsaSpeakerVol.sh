#!/bin/bash
# Stub description

echo "Installing alsa Speaker Volume Fix..."

$ROOT/lib/tools/usr_local_permissions.sh

if [ -e "/usr/local/bin/alsaSpekerVol" ]; then
	sudo rm /usr/local/bin/alsaSpekerVol
fi

touch /usr/local/bin/alsaSpekerVol
chmod +x /usr/local/bin/alsaSpekerVol
echo -e '#!/bin/bash\namixer set Speaker 100% > /dev/null\nexit' | sudo tee /usr/local/bin/alsaSpekerVol

if [ -e "/usr/local/bin/repair.png" ]; then
	sudo rm /usr/local/bin/repair.png
fi

cp "${ROOT}/config/alsaSpekerVol/repair.png" /usr/local/bin/

if [ -e "/usr/share/applications/alsaSpekerVol.desktop" ]; then
	sudo rm /usr/share/applications/alsaSpekerVol.desktop
fi

echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=alsa Speaker Volume Fix\nComment=Sets the Speaker Volume in alsamixer to 100%.\nExec=/usr/local/bin/alsaSpekerVol\nIcon=/usr/local/bin/repair.png\nTerminal=false\nType=Application\nCategories=Utilities;" | sudo tee /usr/share/applications/alsaSpekerVol.desktop
