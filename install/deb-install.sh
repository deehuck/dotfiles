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
echo " Installing thoughtbot repo to install rcm "
echo " Don't worry this repo isn't nefarious. Won't hurt yr apt-get one bit 😘"
echo " "
echo " Please enter your password to add deb http://apt.thoughtbot.com/debian/ "
echo " to /etc/apt/sources.list.d/ "
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo " deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " making sure everything is installed on this machine...
      git, mosh, node tmux neovim irssi and rcm htop fortune slurm multitail"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

sudo apt-get -y install git htop fortune nodejs tmux slurm neovim irssi rcm multitail mosh

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Installing necessary pip packages for nvim"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

sudo pip install neovim
sudo pip3 install neovim

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Cloning the dotfiles to .dotfiles directory"
echo " Feel free to create your own custom branch and make changes"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

git clone https://git.brain.rip/dhuck/dotfiles.git ~/.dotfiles

# Set up oh my zsh
#echo " Checking and Install oh-my-zsh.sh"
#
#
#ohmyzsh="$HOME/.oh-my-zsh"
#if [ -f "$ohmyzsh" ]
#then
#  echo " Oh My ZSH! is already installed. Nothing to do"
#else
#  echo " Install Oh My ZSH!"
#  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#fi


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
echo " This operation requires your password. Enter your password to change the de- "
echo " fault shell to zsh. If you would like to keep bash as your default shell to "
echo " cancel this process. "
echo " "
echo "     - -- --- ----- --- -- - -- --- ----- --- -- -  "

chsh -s /bin/zsh
echo "     - -- --- ----- --- -- - -- --- ----- --- -- -  "
echo " "

zsh

