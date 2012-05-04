#!/bin/bash
# Downloads and Installs ANTLRWorks with an Entry in the Development applications folder

wget http://www.antlr.org/download.html -O ~/Downloads/antlrworks-index.html &>> $logfile
VANTLRWORKS=`grep -E -o "http:\/\/www\.antlr\.org\/download\/antlrworks-[0-9\.]+\.jar" ~/Downloads/antlrworks-index.html` &>> $logfile
VANTLRTEMP=`grep -E -o "href=\"\/download\/antlr-[0-9\.]+-complete-no-antlrv2\.jar" ~/Downloads/antlrworks-index.html` &>> $logfile
VANTLRSHORT=`echo "${VANTLRTEMP}"|cut -d "\"" -f 2` &>> $logfile
VANTLR="http://www.antlr.org${VANTLRSHORT}" &>> $logfile

sudo rm -rf /usr/local/bin/ANTLRWorks/ &>> $logfile
sudo mkdir /usr/local/bin/ANTLRWorks/ &>> $logfile
echo "Downloading ANTLRWorks..."
echo -e "\tDownloading file: ${VANTLRWORKS}"
sudo wget $VANTLRWORKS -O /usr/local/bin/ANTLRWorks/antlrworks.jar &>> $logfile
echo -e "\tDownloading file: ${VANTLR}"
sudo wget $VANTLR -O /usr/local/bin/ANTLRWorks/antlr.jar &>> $logfile
echo "Installing ANTLRWorks Unity Shortcut..."

if [ -e /usr/share/applications/antlrworks.desktop ]
then
	sudo rm /usr/share/applications/antlrworks.desktop &>> $logfile
else
	echo "antlrworks never previously installed" &>> $logfile
fi


pushd /usr/local/bin/ANTLRWorks/ &>> $logfile
sudo jar -xf antlrworks.jar icons/app.png &>> $logfile
sudo mv /usr/local/bin/ANTLRWorks/icons/app.png /usr/local/bin/ANTLRWorks/ &>> $logfile
sudo rm -rf /usr/local/bin/ANTLRWorks/icons/ &>> $logfile
popd &>> $logfile
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=ANTLRWorks\nComment=An amazing compiler compiler.\nExec=java -jar /usr/local/bin/ANTLRWorks/antlrworks.jar\nIcon=/usr/local/bin/ANTLRWorks/app.png\nTerminal=false\nType=Application\nCategories=Development;" | sudo tee /usr/share/applications/antlrworks.desktop &>> $logfile

echo "Adding ANTLRWorks BashRC Lines..."
if grep -Fxq 'export CLASSPATH=/usr/local/bin/ANTLRWorks/antlr.jar:$CLASSPATH' ~/.bashrc
then
	echo -e '\t"export CLASSPATH=/usr/local/bin/ANTLRWorks/antlr.jar:$CLASSPATH" already in ~\.bashrc!'
else
	echo -e '\t"export CLASSPATH=/usr/local/bin/ANTLRWorks/antlr.jar:$CLASSPATH" added to ~\.bashrc!'
	echo -e '\nexport CLASSPATH=/usr/local/bin/ANTLRWorks/antlr.jar:$CLASSPATH' >> ~/.bashrc
fi
