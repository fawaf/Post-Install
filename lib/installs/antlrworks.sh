#!/bin/bash
# Downloads and Installs ANTLRWorks with an Entry in the Development applications folder

sudo rm -rf /usr/local/bin/ANTLRWorks/ &>> $logfile
sudo mkdir /usr/local/bin/ANTLRWorks/ &>> $logfile
echo "Downloading ANTLRWorks..."
sudo wget -q http://www.antlr.org/download/antlrworks-1.4.3.jar -O /usr/local/bin/ANTLRWorks/antlrworks.jar &>> $logfile
sudo wget -q http://www.antlr.org/download/antlr-3.4-complete-no-antlrv2.jar -O /usr/local/bin/ANTLRWorks/antlr.jar &>> $logfile
echo "Installing ANTLRWorks Unity Shortcut..."
sudo rm /usr/share/applications/antlrworks.desktop &>> $logfile
sudo jar -xf /usr/local/bin/ANTLRWorks/antlrworks-1.4.3.jar icons/app.png &>> $logfile
sudo mv /usr/local/bin/ANTLRWorks/icons/app.png /usr/local/bin/ANTLRWorks/ &>> $logfile
sudo rm -rf /usr/local/bin/ANTLRWorks/icons/ &>> $logfile
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=ANTLRWorks\nComment=An amazing compiler compiler.\nExec=java -jar /usr/local/bin/ANTLRWorks/antlrworks.jar\nIcon=/usr/local/bin/ANTLRWorks/app.png\nTerminal=false\nType=Application\nCategories=Development;" | sudo tee /usr/share/applications/antlrworks.desktop &>> $logfile
