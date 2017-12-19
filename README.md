# dhuck's dotfile

This is a fork of mharrington's [github repo](https://github.com/mhartington/dotfiles).

## Requirements

This Repo requires Python3, tmux, git, nvim, zsh, and fortune to work completely. Debian/Ubuntu also requires multitail for certain aliases.

## Install

<span style='color:red'>WARNING: THESE SCRIPTS WILL OVERWRITE YOUR CURRENT .ALIAS, .BASHRC, .VIMRC, AND OTHER CONFIG  FILES. PLEASE BACK THESE UP IF YOU ARE WISHING TO TRY THIS OUT ANDWISH TO SAVE YOUR CURRENT CONFIGS

If you are installing on a fresh machine or would like to double check requirements, run one of the following scripts:

### OSX

```
curl https://raw.githubusercontent.com/deehuck/dotfiles/master/install/osx-install.sh | sh
```

### Debian/Ubuntu

```
curl https://raw.githubusercontent.com/deehuck/dotfiles/master/install/deb-install.sh | sh
```

Note: The Debian/Ubuntu scripts will also install slurm, htop, and irssi. These will make you a better human.

If you already have the requirements installed you can use the following commands to install and link your resource files.

### OSX

```
brew tap thoughtbot/formulae
brew install rcm
git https://github.com/deehuck/dotfiles.git ~/.dotfiles
cd $HOME
rcup
```

### Debian/Ubuntu

```
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install rcm
git clone https://github.com/deehuck/dotfiles.git ~/.dotfiles
cd $HOME
rcup
```

## Troubleshooting

If deoplete gives an error on first run of nvim, run the following command to add python3 neovim support:

```
pip3 install neovim
```

Restart neovim and run the :UpdateRemotePlugins and deoplete should operate normally after that.

### Issues

Deoplete seems to break on debian machines with the current config. Works :100: otherwise.
# mharrington's Notes

Everything below is lifted from mharington's repo page. This will change overtime as I make my own changes.

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


<hr/>
I think that's it, probably missed a few things here and there or spelled something wrong.
This is more for my own sake when setting up a new machine so I can figure out what the fuck is actually going on.

## Inspiration
- [mharrington's Dotfiles](https://github.com/mhartington/dotfiles)
- [Maximum Awesome](https://github.com/square/maximum-awesome)
- [Paul's Dotfiles](https://github.com/paulirish/dotfiles)
- [Andrew's Dotfiles](https://github.com/ajoslin/dot)
