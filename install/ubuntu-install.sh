#!/bin/sh


echo " Welcome to deehuck's dotfiles for linux. big ups to mharington for the legwork"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo "       .___.__                   __   /\            "
echo "     __| _/|  |__  __ __   ____ |  | _)/ ______     "
echo "    / __ | |  |  \|  |  \_/ ___\|  |/ / /  ___/     "
echo "   / /_/ | |   Y  \  |  /\  \___|    <  \___ \      "
echo "   \____ | |___|  /____/  \___  >__|_ \/____  >     "
echo "        \/      \/            \/     \/     \/      "
echo "     .___      __    _____.__.__                    "
echo "   __| _/_____/  |__/ ____\__|  |   ____   ______   "
echo "  / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/   "
echo " / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \    "
echo " \____ |\____/|__|  |__|  |__|____/\___  >____  >   "
echo "      \/                               \/     \/    "


echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Installing Repos for neovim and rcm"
echo " Don't worry this repo isn't nefarious. Won't hurt yr apt-get one bit 😘"
echo " "
echo " Please enter your password to add deb http://apt.thoughtbot.com/debian/ "
echo " to /etc/apt/sources.list.d/ "
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

sudo echo "Got password!"
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm > /dev/null
sudo apt-add-repository ppa:neovim-ppa/stable > /dev/null
sudo apt-get update

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " making sure everything is installed on this machine...
      git, mosh, node tmux neovim irssi and rcm htop fortune slurm multitail"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

sudo apt-get -y install git htop fortune nodejs tmux slurm neovim irssi rcm multitail mosh python-pip python3-pip build-essential > /dev/null

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Installing necessary pip packages for nvim"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

cd $HOME
read pause
pip install --user neovim
pip3 install --user  neovim

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Cloning the dotfiles to .dotfiles directory"
echo " Feel free to create your own custom branch and make changes"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles > /dev/null
cd .dotfiles
git checkout ubuntu > /dev/null

cd $HOME

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " running RCM's rcup command"
echo " This will symlink the rc files in $HOME to those in the dotfiles directory"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

rcup -f

#Clean up superfluous files created by rcup
rm -rf .install

#echo "     - -- --- ----- --- -- - -- --- ----- --- -- -  "
echo " "
echo " Changing over to zsh..."
echo " "
echo "     - -- --- ----- --- -- - -- --- ----- --- -- -  "

sudo chsh -s /bin/zsh $USER

echo " All done! "

zsh

