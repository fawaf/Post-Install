sudo add-apt-repository ppa:tiheum/equinox

##thunderbird ppa
sudo add-apt-repository ppa:mozillateam/thunderbird-stable

#gimp daily ppa
sudo add-apt-repository ppa:matthaeus123/mrw-gimp-svn

##gwibber microbloggin client ppa
sudo add-apt-repository ppa:gwibber-team/ppa

##wine ppa
sudo add-apt-repository ppa:ubuntu-wine/ppa

##git ppa
sudo add-apt-repository ppa:git-core/ppa

##ubuntu tweak ppa
sudo add-apt-repository ppa:tualatrix/ppa

##xbmc media center unstable ppa
sudo add-apt-repository ppa:team-xbmc/unstable

##openshot video editor ppa
sudo add-apt-repository ppa:jonoomph/openshot-edge

##lookit screencap program ppa
sudo add-apt-repository ppa:lookit/ppa

##super-boot-manager ppa
sudo add-apt-repository ppa:ingalex/super-boot-manager

##pithos (lightweight pandora client) ppa
sudo add-apt-repository ppa:kevin-mehall/pithos-daily


sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

## Enable Canonical Repositories
sudo sed -i -e "s/# deb http:\/\/archive.canonical.com\/ubuntu/deb http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list
sudo sed -i -e "s/# deb-src http:\/\/archive.canonical.com\/ubuntu/deb-src http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list

## Spotify Repository
echo -e "\n## Spotify Repository\ndeb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify-ppa.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E

## Opera Repository
echo -e "\n## Opera Repository\ndeb http://deb.opera.com/opera/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-ppa.list
wget -q -O - http://deb.opera.com/archive.key | sudo apt-key add -

## MongoDB Repository
echo -e "\n## MongoDB Repository\ndeb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb-ppa.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

qq_update
