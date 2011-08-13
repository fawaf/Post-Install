# Installs all of the applications EXCEPT the ones accessable from the repositories installed before
source $root/lib/tools/qq_update.sh

sudo apt-get -qqy install gimp ubuntu-restricted-extras compizconfig-settings-manager compiz-fusion-plugins-extra chromium-browser lo-menubar conky sun-java6-jre sun-java6-plugin sun-java6-fonts git samba filezilla googlecl pithos gedit-plugins

echo "Asking for you to decide which version of java to use..."
sudo update-alternatives --config java
