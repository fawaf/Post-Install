#!/bin/bash
# Downloads and Installs Minecraft with an Entry in the Games applications folder

sudo mkdir /usr/local/bin/minecraft/
sudo wget -q http://www.minecraft.net/download/minecraft.jar -O /usr/local/bin/minecraft/minecraft.jar
wget -q http://www.minecraft.net/favicon.png -O ~/Downloads/favicon.png
sudo cp ~/Downloads/favicon.png /usr/local/bin/minecraft/
rm ~/Downloads/favicon.png
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Minecraft\nComment=Minecraft is a game about placing blocks to build anything you can imagine.\nExec=java -Xmx1024M -Xms512M -cp /usr/local/bin/minecraft/minecraft.jar net.minecraft.LauncherFrame\nIcon=/usr/local/bin/minecraft/favicon.png\nTerminal=false\nType=Application\nCategories=Games;" | sudo tee /usr/share/applications/minecraft.desktop
