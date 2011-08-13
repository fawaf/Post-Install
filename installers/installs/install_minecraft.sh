# Downloads and Installs Minecraft with an Entry in the Games applications folder

sudo mkdir /usr/local/bin/minecraft/
sudo wget -q http://www.minecraft.net/download/minecraft.jar -O /usr/local/bin/minecraft/minecraft.jar
wget -q http://kaishinlab.com/wp-content/uploads/files/minecraft.zip -O ~/Downloads/minecraft_icons.zip
mkdir ~/Downloads/minecraft_icons
unzip ~/Downloads/minecraft_icons.zip -d ~/Downloads/minecraft_icons/
sudo cp ~/Downloads/minecraft_icons/minecraft/PNG/Minecraft.png /usr/local/bin/minecraft/
rm ~/Downloads/minecraft_icons.zip
rm -rf /~Downloads/minecraft_icons/
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Minecraft\nComment=Minecraft is a game about placing blocks to build anything you can imagine.\nExec=java -Xmx1024M -Xms512M -cp /usr/local/bin/minecraft/minecraft.jar net.minecraft.LauncherFrame\nIcon=/usr/local/bin/minecraft/Minecraft.png\nTerminal=false\nType=Application\nCategories=Games;" | sudo tee /usr/share/applications/minecraft.desktop
