#!/bin/bash
# Stub description

echo "Installing alsa Speaker Volume Fix..."

$ROOT/lib/tools/usr_local_permissions.sh

if [ -e "/usr/local/bin/alsaSpeakerVol" ]; then
	sudo rm /usr/local/bin/alsaSpeakerVol
fi

touch /usr/local/bin/alsaSpeakerVol
chmod +x /usr/local/bin/alsaSpeakerVol
echo -e '#!/bin/bash\namixer set Speaker 100% > /dev/null\nexit' | sudo tee /usr/local/bin/alsaSpeakerVol

if [ -e "/usr/local/bin/repair.png" ]; then
	sudo rm /usr/local/bin/repair.png
fi

cp "${ROOT}/config/alsaSpeakerVol/repair.png" /usr/local/bin/

if [ -e "/usr/share/applications/alsaSpeakerVol.desktop" ]; then
	sudo rm /usr/share/applications/alsaSpeakerVol.desktop
fi

echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=alsa Speaker Volume Fix\nComment=Sets the Speaker Volume in alsamixer to 100%.\nExec=/usr/local/bin/alsaSpeakerVol\nIcon=/usr/local/bin/repair.png\nTerminal=false\nType=Application\nCategories=Utilities;" | sudo tee /usr/share/applications/alsaSpeakerVol.desktop
