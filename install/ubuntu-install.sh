#!/bin/bash
checkbox="\e[1m[\e[32m✔\e[39m]\e[34m"
normal="\e[39m\e[0m\e[25m"
green="\e[92m"
blink="\e[5m"


echo -e $green $blink
echo -e "       .___.__                   __   /\            "
echo -e "     __| _/|  |__  __ __   ____ |  | _)/ ______     "
echo -e "    / __ | |  |  \|  |  \_/ ___\|  |/ / /  ___/     "
echo -e "   / /_/ | |   Y  \  |  /\  \___|    <  \___ \      "
echo -e "   \____ | |___|  /____/  \___  >__|_ \/____  >     "
echo -e "        \/      \/            \/     \/     \/      "
echo -e "     .___      __    _____.__.__                    "
echo -e "   __| _/_____/  |__/ ____\__|  |   ____   ______   "
echo -e "  / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/   "
echo -e " / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \    "
echo -e " \____ |\____/|__|  |__|  |__|____/\___  >____  >   "
echo -e "      \/                               \/     \/    "
echo -e " "
echo -e $normal
echo -e " Welcome to deehuck's dotfiles for linux. big ups to mharington for the legwork"

echo -e "$checkbox Installing Repos for neovim and rcm$normal"
echo -e " Don't worry this repo isn't nefarious. Won't hurt yr apt-get one bit 😘"
echo -e " "
echo -e " Please enter your password to add deb http://apt.thoughtbot.com/debian/ "
echo -e " to /etc/apt/sources.list.d/ "

if [ ! -d ".cache" ]; then
    echo -e "Creating cache directory"
    mkdir $HOME/.cache
fi

sudo echo -e "$checkbox sudo unlocked!"
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm > /dev/null
sudo apt-add-repository ppa:neovim-ppa/stable > /dev/null
sudo apt-get update > /dev/null

echo -e "$checkbox making sure everything is installed on this machine...
      git, mosh, node tmux neovim irssi and rcm htop fortune slurm multitail"

sudo apt-get -y install git htop fortune nodejs tm/:ux slurm neovim irssi rcm multitail mosh python-pip python3-pip build-essential > /dev/null

echo -e "$checkbox Installing necessary pip packages for nvim"

cd $HOME
pip install --user neovim > /dev/null
pip3 install --user neovim > /dev/null

echo -e "$checkbox Installing numpy, scipy, pandas, altair, matplotlib "
pip install numpy, scipy, pandas, altair, matplotlib > /dev/null
pip3 install numpy, scipy, pandas, altair, matplotlib > /dev/null

echo -e "$checkbox Cloning the dotfiles to .dotfiles directory"
echo -e "$checkbox Feel free to create your own custom branch and make changes"

git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles > /dev/null
cd .dotfiles
git checkout ubuntu > /dev/null

cd $HOME

echo -e "$checkbox running RCM's rcup command"
echo -e "$checkbox This will symlink the rc files in $HOME to those in the dotfiles directory"

rcup -f

#Clean up superfluous files created by rcup
rm -rf .install

echo -e "$checkbox Updating nvim plugins"
echo -ne '\n' | nvim +qall

echo -e "$checkbox Setting zsh as default shell"

sudo chsh -s /bin/zsh $USER

echo -e "$checkbox All done! Logout and log back in to apply changes!"

