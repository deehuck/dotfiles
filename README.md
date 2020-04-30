# dhuck's dotfile

This began as a fork of mharrington's [github repo](https://github.com/mhartington/dotfiles). I have since slimmed it down and modified it for my own use. There is a lot left from mharrington and I am forever grateful for his contribution.

There are different branches for different operating systems. The installation process will be slightly different for each. The default branch installs the dot files for macos. To change to a different branch, simply checkout that branch and run `source .zshrc`.

## Requirements

This Repo requires Python, Python 3, tmux, git, nvim, zsh, and fortune to work completely. You must also ensure the Neovim Python package is installed for Python and Python 3. You can do this using the command, `sudo pip install --user neovim` and `sudo pip3 --user install neovim`. Debian/Ubuntu also requires multitail for certain aliases.

## Install

__WARNING: THESE SCRIPTS WILL OVERWRITE YOUR CURRENT .ALIAS, .BASHRC, .VIMRC, AND OTHER CONFIG  FILES. PLEASE BACK THESE UP IF YOU ARE WISHING TO TRY THIS OUT AND WISH TO SAVE YOUR CURRENT CONFIGS__

### OSX

```sh
brew tap thoughtbot/formulae
brew install rcm
git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles
cd $HOME
rcup
```

### Debian

```sh
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install rcm
git clone https://gitlab.com/dhuck/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout debian
cd $HOME
rcup
```

## Neovim and Python

Deoplete is a neovim plugin that gives auto-complete options across several languages. In order to work, it requires the neovim python package to be installed for both Python and Python3. If your Python installs are not set up oddly or you do not have the neovim package installed, you _will_ have deoplete issues.

```sh
pip install --user neovim
pip3 install --user neovim
```

Restart neovim and run the :UpdateRemotePlugins and deoplete should operate normally. If you are still having issues, ensure that your python is installed to `/usr/lib/python` and `usr/lib/python3` on Linux. On a Mac, Python3 may be installed to `/usr/local/lib/python3`. This is fine and will not break neovim.

God bless Danny Brown. He's done so much with that goddamn voice of his.

## Inspiration
- [mharrington's Dotfiles](https://github.com/mhartington/dotfiles)
- [Maximum Awesome](https://github.com/square/maximum-awesome)
- [Paul's Dotfiles](https://github.com/paulirish/dotfiles)
- [Andrew's Dotfiles](https://github.com/ajoslin/dot)
