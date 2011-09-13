#!/bin/bash
# github.com
# Configuring Your github account
#

sudo apt-get install git

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

read -p "Github User Name: " USERNAME
read -p "Github Email    : " EMAIL

git config --global user.name "$USERNAME"
git config --global user.email $EMAIL

echo "Proceed to https://github.com/account/ssh and add your ssh key to your account."
echo "This is your ssh key, and it is now in your clipboard\n"
cat ~/.ssh/id_*.pub | xclip -selection clipboard
echo "Setting up bash tab autocompletion for git... not. I'm too lazy"
