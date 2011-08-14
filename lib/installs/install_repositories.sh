ureltemp=`egrep "DISTRIB_CODENAME=" /etc/lsb-release`
urel=`echo "${ureltemp}"|cut -d "=" -f 2`

at="Git Stable PPA"
if [ -e "/etc/apt/sources.list.d/git-core-ppa-${urel}.list" ]; then
	echo "[X] ${at}"
	a="n"
else
	echo "[ ] ${at}"
	read -p "Install ${at} (y/n)? " a
fi

bt="Faenza Icon Theme PPA"
if [ -e "/etc/apt/sources.list.d/tiheum-equinox-${urel}.list" ]; then
	echo "[X] ${bt}"
	b="n"
else
	echo "[ ] ${bt}"
	read -p "Install ${bt} (y/n)? " b
fi

ct="Thunderbird Stable PPA"
if [ -e "/etc/apt/sources.list.d/mozillateam-thunderbird-stable-${urel}.list" ]; then
	echo "[X] ${ct}"
	c="n"
else
	echo "[ ] ${ct}"
	read -p "Install ${ct} (y/n)? " c
fi

dt="Gimp Nightly PPA"
if [ -e "/etc/apt/sources.list.d/matthaeus123-mrw-gimp-svn-${urel}.list" ]; then
	echo "[X] ${dt}"
	d="n"
else
	echo "[ ] ${dt}"
	read -p "Install ${dt} (y/n)? " d
fi

et="Gwibber PPA"
if [ -e "/etc/apt/sources.list.d/gwibber-team-ppa-${urel}.list" ]; then
	echo "[X] ${et}"
	e="n"
else
	echo "[ ] ${et}"
	read -p "Install ${et} (y/n)? " e
fi

ft="Wine PPA"
if [ -e "/etc/apt/sources.list.d/ubuntu-wine-ppa-${urel}.list" ]; then
	echo "[X] ${ft}"
	f="n"
else
	echo "[ ] ${ft}"
	read -p "Install ${ft} (y/n)? " f
fi

gt="Ubuntu Tweak PPA"
if [ -e "/etc/apt/sources.list.d/tualatrix-ppa-${urel}.list" ]; then
	echo "[X] ${gt}"
	g="n"
else
	echo "[ ] ${gt}"
	read -p "Install ${gt} (y/n)? " g
fi

ht="XBMC Unstable PPA"
if [ -e "/etc/apt/sources.list.d/team-xbmc-unstable-${urel}.list" ]; then
	echo "[X] ${ht}"
	h="n"
else
	echo "[ ] ${ht}"
	read -p "Install ${ht} (y/n)? " h
fi

it="Openshot Video Editor PPA"
if [ -e "/etc/apt/sources.list.d/jonoomph-openshot-edge-${urel}.list" ]; then
	echo "[X] ${it}"
	i="n"
else
	echo "[ ] ${it}"
	read -p "Install ${it} (y/n)? " i
fi

jt="Lookit PPA"
if [ -e "/etc/apt/sources.list.d/lookit-ppa-${urel}.list" ]; then
	echo "[X] ${jt}"
	j="n"
else
	echo "[ ] ${jt}"
	read -p "Install ${jt} (y/n)? " j
fi

kt="Super Boot Manager PPA"
if [ -e "/etc/apt/sources.list.d/ingalex-super-boot-manager-${urel}.list" ]; then
	echo "[X] ${kt}"
	k="n"
else
	echo "[ ] ${kt}"
	read -p "Install ${kt} (y/n)? " k
fi

lt="Pithos (Pandora Client) PPA"
if [ -e "/etc/apt/sources.list.d/kevin-mehall-pithos-daily-${urel}.list" ]; then
	echo "[X] ${lt}"
	l="n"
else
	echo "[ ] ${lt}"
	read -p "Install ${lt} (y/n)? " l
fi

##===================================================
## Special Repositories
##===================================================

cant="Canonical Partners Repository"
##canrepo=echo `egrep -o "# deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list`
##canrepo1=echo `egrep -o "deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list`
if [[ (`egrep -o "# deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list` == "") && (`egrep -o "deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list` != "") ]]; then
	echo "[X] ${cant}"
	can="n"
elif [[ (`egrep -o "# deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list` == "") && (`egrep -o "deb http:\/\/archive.canonical.com\/ubuntu" /etc/apt/sources.list` == "") ]]; then
	echo "You do not have Ubuntu and cannot enable the ${cant}."
	can="n"
else
	echo "[ ] ${cant}"
	read -p "Enable ${cant} (y/n)? " can
fi

spotifyt="Spotify Repository"
if [ -e "/etc/apt/sources.list.d/spotify-repo.list" ]; then
	echo "[X] ${spotifyt}"
	spotify="n"
else
	echo "[ ] ${spotifyt}"
	read -p "Install ${spotifyt} (y/n)? " spotify
fi

operat="Opera Repository"
if [ -e "/etc/apt/sources.list.d/opera-repo.list" ]; then
	echo "[X] ${operat}"
	opera="n"
else
	echo "[ ] ${operat}"
	read -p "Install ${operat} (y/n)? " opera
fi

mongot="MongoDB Repository"
if [ -e "/etc/apt/sources.list.d/mongodb-repo.list" ]; then
	echo "[X] ${mongot}"
	mongo="n"
else
	echo "[ ] ${mongot}"
	read -p "Install ${mongot} (y/n)? " mongo
fi

##===================================================
##===================================================

##git ppa
if [[ "$a" == "y" ]]; then
	sudo add-apt-repository ppa:git-core/ppa
fi

##Faenza Icon Theme ppa
if [[ "$b" == "y" ]]; then
	sudo add-apt-repository ppa:tiheum/equinox
fi

##thunderbird ppa
if [[ "$c" == "y" ]]; then
	sudo add-apt-repository ppa:mozillateam/thunderbird-stable
fi

#gimp daily ppa
if [[ "$d" == "y" ]]; then
	sudo add-apt-repository ppa:matthaeus123/mrw-gimp-svn
fi

##gwibber microbloggin client ppa
if [[ "$e" == "y" ]]; then
	sudo add-apt-repository ppa:gwibber-team/ppa
fi

##wine ppa
if [[ "$f" == "y" ]]; then
	sudo add-apt-repository ppa:ubuntu-wine/ppa
fi

##ubuntu tweak ppa
if [[ "$g" == "y" ]]; then
	sudo add-apt-repository ppa:tualatrix/ppa
fi

##xbmc media center unstable ppa
if [[ "$h" == "y" ]]; then
	sudo add-apt-repository ppa:team-xbmc/unstable
fi

##openshot video editor ppa
if [[ "$i" == "y" ]]; then
	sudo add-apt-repository ppa:jonoomph/openshot-edge
fi

##lookit screencap program ppa
if [[ "$j" == "y" ]]; then
	sudo add-apt-repository ppa:lookit/ppa
fi

##super-boot-manager ppa
if [[ "$k" == "y" ]]; then
	sudo add-apt-repository ppa:ingalex/super-boot-manager
fi

##pithos (lightweight pandora client) ppa
if [[ "$l" == "y" ]]; then
	sudo add-apt-repository ppa:kevin-mehall/pithos-daily
fi


sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

## Enable Canonical Repositories
if [[ "$can" == "y" ]]; then
	sudo sed -i -e "s/# deb http:\/\/archive.canonical.com\/ubuntu/deb http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list
	sudo sed -i -e "s/# deb-src http:\/\/archive.canonical.com\/ubuntu/deb-src http:\/\/archive.canonical.com\/ubuntu/g" /etc/apt/sources.list
fi

## Spotify Repository
if [[ "$spotify" == "y" ]]; then
	echo -e "## Spotify Repository\ndeb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify-repo.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
fi

## Opera Repository
if [[ "$opera" == "y" ]]; then
	echo -e "## Opera Repository\ndeb http://deb.opera.com/opera/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-repo.list
	wget -q -O - http://deb.opera.com/archive.key | sudo apt-key add -
fi

## MongoDB Repository
if [[ "$mongo" == "y" ]]; then
	echo -e "## MongoDB Repository\ndeb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb-repo.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
fi

qq_update
