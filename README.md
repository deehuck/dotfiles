# dhuck's dotfile

This started as a fork of mharrington's [github repo](https://github.com/mhartington/dotfiles). I have since slimmed it down and modified it for my own use. There is a lot left from mharrington and I am forever grateful for his contribution.

There are different branches for different operating systems. The installation process will be slightly different for each. The default branch installs the dot files for macos. To change to a different branch, simply checkout that branch and run `source .zshrc`.

## Requirements

This Repo requires Python, Python 3, tmux, git, nvim, zsh, and fortune to work completely. You must also ensure the Neovim Python package is installed for Python and Python 3. You can do this using the command, `sudo pip install neovim` and `sudo pip3 install neovim`. Debian/Ubuntu also requires multitail for certain aliases.

## Install

<span style='color:red'>__WARNING: THESE SCRIPTS WILL OVERWRITE YOUR CURRENT .ALIAS, .BASHRC, .VIMRC, AND OTHER CONFIG  FILES. PLEASE BACK THESE UP IF YOU ARE WISHING TO TRY THIS OUT AND WISH TO SAVE YOUR CURRENT CONFIGS__</span>

### OSX

```sh
brew tap thoughtbot/formulae
brew install rcm
git https://git.brain.rip/dhuck/dotfiles.git ~/.dotfiles
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
```ec

## Neovim and Python

Deoplete is a neovim plugin that gives auto-complete options across several languages. In order to work, it requires the neovim python package to be installed for both Python and Python3. If your Python installs are not set up oddly or you do not have the neovim package installed, you _will_ have deoplete issues.

```sh
pip install neovim
pip3 install neovim
```

Restart neovim and run the :UpdateRemotePlugins and deoplete should operate normally. If you are still having issues, ensure that your python is installed to `/usr/lib/python` and `usr/lib/python3` on Linux. On a Mac, Python3 may be installed to `/usr/local/lib/python3`. This is fine and will not break neovim.

God bless Danny Brown. He's done so much with that goddamn voice of his.

# mharrington's Notes

Everything below is reproduced from mharington's repo page. This will change overtime as I make my own changes.

## Note to iterm
Iterm nightly is a must.
Or any terminal that supports true colors.

Once installed, click on the iterm color config in `config/colors` to add oceanicNext

## NeoVim

I've moved over to neovim completely. It still has it's problems here and there, but its pretty stable for the most part.

Anyways, neovim has support for true colors, so that flag is turned on.
Some key plugins for neovim are:


### Vim-Airline
[vim-airline](https://github.com/vim-airline/vim-airline) is much lighterweight, intergrates with a bunch of plugins I
already have, and is eaiser to set up.

```
call dein#add('vim-airline/vim-airline')
```

### Anything by Shougo
The guy is big in the vim/neovim community and his plugins are top notch.
Hell, even my plugin manager is made by him. If he ever sees this, thanks Shougo!

### [Quramy/tsuquyomi](https://github.com/Quramy/tsuquyomi)
Code completion for typescript. This is a must for me.

```bash
# install typescript
npm -g install typescript
```


```viml
call dein#add('Shougo/deoplete')
call dein#add('mhartington/deoplte-typescript')
```

It may take a bit on first startup or with a large project, but that's typescript's fault...not mine.

### [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

This is really optional and over the top, but it adds icons to your file tree (if using nerdTree). So over the top....I need it.

I use Source Code Pro for my fonts, maybe you do too. But we're using powerline here folks, so we need some patched fonts.

https://github.com/ryanoasis/nerd-fonts

Install one of these fonts and you should be good to go. Don't forget to set your terminal font to that font as well.

## Tmux

So if you can tell by now, I'm set on using true colors....everywhere.

You can run `brew install tmux --head` and get all the colors for iterm nightly.

### Tmux powerline
My status bar for tmux is custom, only using a few plugins for battery charge and memory usage. Was a nice experiment with the tmux API. Also it uses powerline symbols, which should be covered.

## Inspiration
- [mharrington's Dotfiles](https://github.com/mhartington/dotfiles)
- [Maximum Awesome](https://github.com/square/maximum-awesome)
- [Paul's Dotfiles](https://github.com/paulirish/dotfiles)
- [Andrew's Dotfiles](https://github.com/ajoslin/dot)
