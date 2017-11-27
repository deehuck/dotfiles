#!/bin/sh

brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

# lua is required with hammerspoon
packages=(
"git"
"node"
"tmux"
"neovim"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "installing RCM, for dotfiles management"
brew tap thoughtbot/formulae
brew install rcm
echo "---------------------------------------------------------"

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
echo "---------------------------------------------------------"

echo "Cloning Mike's dotfiles insto .dotfiles"
git clone ssh://git@88.99.137.36:2273/dhuck/dotfiles.git ~/.dotfiles

cd .dotfiles
# git submodule update --init --recursive

cd $HOME
echo "running RCM's rcup command"
echo "This is symlink the rc files in .dofiles"
echo "with the rc files in $HOME"
echo "---------------------------------------------------------"

rcup

echo "---------------------------------------------------------"

echo "Changing to zsh"
chsh -s $(which zsh)

echo "You'll need to log out for this to take effect"
echo "---------------------------------------------------------"

echo "running osx defaults"
~./osx.sh

echo "---------------------------------------------------------"
# Removing hammerspoon until a later date.

# echo "Downloading Hammerspoon"
# cd ~/Downloads
# curl https://github.com/Hammerspoon/hammerspoon/releases/download/0.9.43/Hammerspoon-0.9.43.zip | unzip
# unzip Hammerspoon-0.9.43.zip
# mv Hammerspoon /Applications/
echo 'done'
echo "---------------------------------------------------------"
echo "All done!"
echo "and change your terminal font to source code pro"
echo "Cheers"
echo "---------------------------------------------------------"

exit 0
