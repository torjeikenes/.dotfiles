# Dotfiles

* Regolith
* pop os
* zsh
* vim
* nvim
* vscode



## Installation

### Basic setup

```hostnamectl set-hostname <NAME>```

### Updates

```
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt autoclean
sudo fwupdmgr get-devices
sudo fwupdmgr get-updates
sudo fwupdmgr update
flatpak update
sudo reboot now
```

### Install programs 

```sudo apt install snapd zsh vim git cmake gnome-tweaks code vlc gh tmux``` 



### Setup terminal

```sudo apt install zsh```

```chsh -s $(which zsh)```

log out and back in


## Install dotfiles

requires ```stow```

```
git clone --bare https://github.com/torjeikenes/.dotfiles $HOME/.dotfiles
cd .dotfiles
stow .
```

### Previous implementation 

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/torjeikenes/.dotfiles $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
```
if checkout failes its because you have other config files that would be overwritten 
to solve this do this:

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
config checkout
```

```
config config --local status.showUntrackedFiles no
```

now you should be able to use the config command to add and update your dotfiles

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

#### Setup gh to push


```
gh auth login

config push --set-upstream origin master
```


## Neovim

[Install neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)


Show plugins in nvim:

```:Lazy```

## Tmux

Install packages in tmux

```<C-b> I```


## Setup vim


```sudo apt install vim```

```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```


in vim:

```:PluginInstall ```

* YouCompleteme: https://github.com/Valloric/YouCompleteMe#full-installation-guide

```sudo apt install cmake```

```cd ~/.vim/bundle/YouCompleteMe ```

``` ./install.py --clangd-completer --rust-completer```


### Notion

```
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list

sudo apt update

sudo apt install notion-app-enhanced
// or
sudo apt install notion-app


```

Ulauncher

```
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update
sudo apt install ulauncher
```

```sudo apt install fzf```

```pip install pint```


### Flatpack / snap

* Dropbox
* spotify
* extension manager


## Regolith setup

https://regolith-desktop.com/docs/using-regolith/install/

### packages

Look

```
regolith-look-nord
```

i3xrocks packages

```
i3xrocks-app-launcher
i3xrocks-battery
i3xrocks-cpu-usage
i3xrocks-info
i3xrocks-memory
i3xrocks-net-traffic
i3xrocks-time
i3xrocks-volume
```

all installed regolith packages 

```
arc-icon-theme
ayu-theme
fonts-nerd-font-bitstreamverasansmono
fonts-nerd-font-robotomono
i3-next-workspace
i3-swap-focus
i3-wm
i3xrocks-app-launcher
i3xrocks-battery
i3xrocks-cpu-usage
i3xrocks-info
i3xrocks-memory
i3xrocks-net-traffic
i3xrocks-time
i3xrocks-volume
i3xrocks
ilia
nordic
picom
regolith-compositor-picom-glx
regolith-control-center
regolith-default-settings
regolith-desktop
regolith-ftue
regolith-i3-compositor
regolith-i3-control-center-regolith
regolith-i3-default-style
regolith-i3-gaps
regolith-i3-i3xrocks
regolith-i3-ilia
regolith-i3-root-config
regolith-i3-session
regolith-i3-unclutter
regolith-i3xrocks-config
regolith-look-default-loader
regolith-look-default
regolith-look-nord
regolith-session-common
regolith-session-flashback-ext
regolith-session-flashback
regolith-unclutter-xfixes
regolith-wm-base-launchers
regolith-wm-config
regolith-wm-ftue
regolith-wm-navigation
regolith-wm-networkmanager
regolith-wm-next-workspace
regolith-wm-resize
regolith-wm-swap-focus
regolith-wm-workspace-config
remontoire
trawlcat
trawld
xrescat

```




## pop os setup (Previously used)

If distro is not pop os, the pop os shell can be installed to get the tiling
capabilities of pop os.

```
git clone https://github.com/pop-os/shell.git
cd shell
make local-install
```

setup keybinds

```bash popOsKeybindings.sh```


### Settings

* Change to fixed number of workspaces
* in keybindings change launch terminal to `ctrl + enter` and disable "launch and switch applications"
* Change wallpaper
* Automatically delete recent files and trash
* Set screen of time
* Set up night mode
* Set mouse settings
* Set 24 h format
* Show battery percentage


### Tweaks

* Add week numbers to calendar
* Set theme
* Set startup applications
* Windows -> Focus on hover

## Extensions

* [user themes](https://extensions.gnome.org/extension/19/user-themes/)
* [Auto move windows](https://extensions.gnome.org/extension/16/auto-move-windows/)
* [just perfection](https://extensions.gnome.org/extension/3843/just-perfection/) Deactivate Activities button
* [vitals](https://extensions.gnome.org/extension/1460/vitals/)
* [Workspaces indicator by open apps](https://extensions.gnome.org/extension/5967/workspaces-indicator-by-open-apps/)
* [Dash to panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
* [Aylur's widgets](https://extensions.gnome.org/extension/5338/aylurs-widgets/)
* [Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)

