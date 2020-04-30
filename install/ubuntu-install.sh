<<<<<<< HEAD
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

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " making sure everything is installed on this machine...
      git, mosh, node tmux neovim irssi and rcm htop fortune slurm multitail"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

sudo apt-get -y install git htop fortune nodejs tmux slurm neovim irssi rcm multitail mosh python-pip python3-pip build-essential

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Installing necessary pip packages for nvim"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

pip install --user neovim
pip3 install --user  neovim

echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"
echo " "
echo " Cloning the dotfiles to .dotfiles directory"
echo " Feel free to create your own custom branch and make changes"
echo " "
echo "  - -- --- ----- --- -- - -- --- ----- --- -- -"

git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles
cd .dotfiles
git checkout ubuntu

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

sudo chsh -s /bin/zsh $USER
echo "     - -- --- ----- --- -- - -- --- ----- --- -- -  "
echo " "

zsh

=======
#!/bin/bash
checkbox="\e[1m\e[39m[\e[32m✔\e[39m]\e[34m"
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
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1
else
    echo " "
    echo -e "$checkbox Installing Repos for neovim and rcm$normal"

    if [ ! -d "$HOME/.cache" ]; then
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
fi
>>>>>>> a9b3617aa80a87b753cb619152624becb0b8096a
