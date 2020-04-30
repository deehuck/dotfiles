#!/bin/sh

echo " Welcome to deehuck's dotfiles for linux. big ups to mharington for the legwork"
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
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# lua is required with hammerspoon
packages=(
"git"
"node"
"htop"
"tmux"
"neovim"
"mosh"
"python"
"ruby"
"go"
"fortune"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "
done

echo "installing RCM, for dotfiles management"
brew tap thoughtbot/formulae
brew install rcm
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

localGit="/usr/local/bin/git"
if [ -f "$localGit" ]
then
  echo "git is all good"
else
  echo "git is not installed"
fi
# Okay so everything should be good
# Fingers cross at least
# Now lets clone my dotfiles repo into .dotfiles/
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

echo "Cloning dhucks's dotfiles into .dotfiles"
git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles

cd .dotfiles
# git submodule update --init --recursive

cd $HOME
echo "running RCM's rcup command"
echo "This is symlink the rc files in .dofiles"
echo "with the rc files in $HOME"
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

rcup

echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

echo "Changing to zsh"
chsh -s $(which zsh)

echo "You'll need to log out for this to take effect"
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

echo 'done'
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "
echo "All done!"
echo "and change your terminal font to source code pro"
echo "Cheers"
echo "   - -- --- ----- --- -- - -- --- ----- --- -- -   "

exit 0
