#!/bin/sh

echo "Welcome to deehuck's dotfiles for linux. big ups to mharington for the legwork"

# Install required programs for sexiness

echo "Don't worry this repo isn't nefarious. Won't hurt yr apt-get one bit 😘"
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update

echo "making sure everything is installed on this machine...
      git, node tmux lua neovim irssi and rcm"
sudo apt-get -y install git node tmux lua neovim irrsi rcm

echo "Cloning the dotfiles to .dotfiles directory"
echo "Feel free to create your own custom branch and make changes"

git clone ssh://git@88.99.137.36:2273/dhuck/dotfiles.git ~/.dotfiles

cd $HOME
:
echo "running RCM's rcup command"
echo "This will symlink the rc files in $HOME to those in the dotfiles directory"

rcup

echo "--------------------------------------------------------------"
echo "Changing over to zsh"
chsh -s $(which zsh)

echo "All done!"
echo ""
echo "If some things did not change like expected, you may need to manually symlink"
echo "some of the files. The rcup command cannot symlink existing files. Delete the"
echo "existing rc files in $HOME and link them with the command ln -s .dotfiles/[ rc"
echo " file ] .[rc file]"

