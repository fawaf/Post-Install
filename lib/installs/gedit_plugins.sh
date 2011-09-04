# Downloads and Installs Gedit Plugins

# Smart Highlighting
VERSH="2.0.0"
wget -q http://smart-highlighting-gedit.googlecode.com/files/smart_highlighting-${VERSH}.tar.gz -O ~/Downloads/smart_highlighting-${VERSH}.tar.gz
tar -zxvf ~/Downloads/smart_highlighting-${VERSH}.tar.gz -C ~/Downloads/
sudo sh ~/Downloads/smart_highlighting-${VERSH}/install.sh
rm -rf ~/Downloads/smart_highlighting-${VERSH}/
rm ~/Downloads/smart_highlighting-${VERSH}.tar.gz

# Pair Char Completion
VERPCC="1.0.5"
wget -q http://gedit-pair-char-autocomplete.googlecode.com/files/gedit-pair-char-completion-${VERPCC}.tar.gz -O ~/Downloads/gedit-pair-char-completion-${VERPCC}.tar.gz
tar -zxvf ~/Downloads/gedit-pair-char-completion-${VERPCC}.tar.gz -C ~/Downloads/
sudo sh ~/Downloads/gedit-pair-char-completion-${VERPCC}/install.sh
rm -rf ~/Downloads/gedit-pair-char-completion-${VERPCC}/
rm ~/Downloads/gedit-pair-char-completion.tar.gz
