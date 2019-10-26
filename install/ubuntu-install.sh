#!/bin/bash
checkbox="\e[1m\e39m[\e[32m✔\e[39m]\e[34m"
normal="\e[39m\e[0m\e[25m"
green="\e[92m"
blink="\e[5m"
bold="\e[1m"
redblinkbold="\e[31m\e[5m\e[1m"
unblink="\e[25m"


echo -e $green
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
echo -e "Welcome to deehuck's dotfiles for linux. big ups to mharington for the legwork"
echo -e "This script requires sudo priveleges to install various packages. If you are "
echo -e "uncomfortable with this, feel free to review the script online. "
echo -e " "
echo -e "$redblinkbold WARNING! $unblink- This may overwrite many of your current dotfiles"
echo -e "This is your only warning. If you want to back up your files do so now."
echo -e " "
read -p "Do you want to continue? [y/N] " -n 1 -r < /dev/tty

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -ne $normal
    echo "Exiting..."
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo -e "$checkbox Installing Repos for neovim and rcm$normal"

if [ ! -d ".cache" ]; then
    echo -e "$checkbox Creating cache directory$normal"
    mkdir $HOME/.cache
fi

sudo echo -e "$checkbox sudo unlocked!"
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm > /dev/null
sudo apt-add-repository ppa:neovim-ppa/stable > /dev/null
sudo apt-get update > /dev/null

echo -e "$checkbox making sure everything is installed on this machine...
      $normal (git htop fortune nodejs tmux slurm neovim irssi rcm multitail mosh python-pip
       python3-pip build-essential)"

sudo apt-get -y install git htop fortune nodejs tmux slurm neovim irssi rcm multitail mosh python-pip python3-pip build-essential > /dev/null

echo -e "$checkbox Installing necessary pip packages for nvim"

cd $HOME
pip install --user neovim > /dev/null
pip3 install --user neovim > /dev/null

echo -e "$checkbox Installing numpy, scipy, pandas, altair, matplotlib "
pip install numpy scipy pandas altair matplotlib > /dev/null
pip3 install numpy scipy pandas altair matplotlib > /dev/null

echo -e "$checkbox Cloning the dotfiles to .dotfiles directory"

git clone --quiet https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles > /dev/null
cd .dotfiles
git checkout --quiet ubuntu > /dev/null

cd $HOME

echo -e "$checkbox running RCM's rcup command"

rcup -f

#Clean up superfluous files created by rcup
rm -rf .install .LICENSE .README.md .TODO

echo -e "$checkbox Setting zsh as default shell (This may ask for your password again)$normal"

sudo chsh -s /bin/zsh $USER

echo -e "$checkbox All done! Logout and log back in to apply changes!"

