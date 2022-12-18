# Dotfiles

* pop os
* zsh
* vim
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

### Setup terminal

```sudo apt install zsh```

```chsh -s $(which zsh)```

log out and back in

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

```git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions```

```git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell ```

## Install dotfiles


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

#### Setup vim


```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```

```sudo apt install vim```


in vim:

```:PluginInstall ```

* YouCompleteme: https://github.com/Valloric/YouCompleteMe#full-installation-guide



## Other installations 
Tweak tools

```sudo apt install gnome-tweaks```

Vscode

```sudo apt install -y code```
VLC

```sudo apt install -y vlc```

* Iosevka font



### Flatpack

* Dropbox
* spotify
* extension manager


## pop os setup

setup keybinds

```bash popOsKeybindings.sh```


### Settings

* Change to fixed number of workspaces
* in keybindings change launch terminal to `ctrl + enter` and disable "launch and switch applications"
* Change wallpaper
* Set to Nordic theme
* Automatically delete recent files and trash
* Set screen of time
* Set up night mode
* Set mouse settings
* Set 24 h format


## Extensions

* user themes
* Auto move windows
* just perfection
* sound output device chooser
* sound percentage
* vitals
* workspaces bar
* Dash to panel
