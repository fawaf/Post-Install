#!/bin/bash
# Downloads and Installs Minecraft with an Entry in the Games applications folder

logfile=/dev/null

sudo rm -rf /usr/local/bin/minecraft &> $logfile
sudo mkdir /usr/local/bin/minecraft/ &> $logfile
echo "Downloading Minecraft..."
sudo wget -q https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar -O /usr/local/bin/minecraft/minecraft.jar &> $logfile
echo "Installing Minecraft Unity Shortcut..."
wget -q http://www.minecraft.net/favicon.png -O ~/Downloads/favicon.png &> $logfile
sudo cp ~/Downloads/favicon.png /usr/local/bin/minecraft/ &> $logfile
rm ~/Downloads/favicon.png &> $logfile
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Minecraft\nComment=Minecraft is a game about placing blocks to build anything you can imagine.\nExec=java -Xmx1024M -Xms512M -cp /usr/local/bin/minecraft/minecraft.jar net.minecraft.LauncherFrame\nIcon=/usr/local/bin/minecraft/favicon.png\nTerminal=false\nType=Application\nCategories=Games;" | sudo tee /usr/share/applications/minecraft.desktop &> $logfile
