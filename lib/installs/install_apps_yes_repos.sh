# Installs all of the applications INCLUDING the ones accessable from the repositories installed before
qq_update

sudo apt-get -qqy install faenza-icon-theme thunderbird gimp gimp-data gimp-plugin-registry gimp-data-extras ubuntu-restricted-extras compizconfig-settings-manager compiz-fusion-plugins-extra google-chrome-stable lo-menubar conky unity-lens-gwibber wine1.3 winetricks spotify-client-qt spotify-client-gnome-support skype opera sun-java6-jre sun-java6-plugin sun-java6-fonts git ubuntu-tweak samba xbmc filezilla openshot openshot-doc googlecl mongodb-10gen lookit super-boot-manager pithos gedit-plugins firefox-trunk

echo "Asking for you to decide which version of java to use..."
sudo update-alternatives --config java
