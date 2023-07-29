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

### Setup terminal

```sudo apt install zsh```

```chsh -s $(which zsh)```

log out and back in

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

```git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions```

```git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell ```


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


## pop os setup

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

### Tweaks

* Add week numbers to calendar
* Set theme
* Set startup applications

## Extensions

* [user themes](https://extensions.gnome.org/extension/19/user-themes/)
* [Auto move windows](https://extensions.gnome.org/extension/16/auto-move-windows/)
* [just perfection](https://extensions.gnome.org/extension/3843/just-perfection/) Deactivate Activities button
* [vitals](https://extensions.gnome.org/extension/1460/vitals/)
* [Workspaces indicator by open apps](https://extensions.gnome.org/extension/5967/workspaces-indicator-by-open-apps/)
* [Dash to panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
* [Aylur's widgets](https://extensions.gnome.org/extension/5338/aylurs-widgets/)

