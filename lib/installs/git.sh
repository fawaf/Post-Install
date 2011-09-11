sudo apt-get install git
git config --global user.name "David Mah"
git config --global user.email Mahhaha@gmail.com
echo "Proceed to https://github.com/account/ssh and add your ssh key to your account."
echo "This is your ssh key, and it is now in your clipboard\n"
cat ~/.ssh/id_*.pub | xclip -selection clipboard
echo "Setting up bash tab autocompletion for git... not. I'm too lazy"
