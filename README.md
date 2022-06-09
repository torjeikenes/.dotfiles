# Dotfiles

* Regolith 
* bspwm(not in use atm)
* polybar(not in use atm)
* zsh
* vim
* urxvt
* vscode



## Installation


### Install dotfiles


Install the following

* vim
* zsh
* oh-my-zsh

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


```git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions```

```git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell ```

```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```

in vim:

```:PluginInstall ```


### Other installations 
* YouCompleteme: https://github.com/Valloric/YouCompleteMe#full-installation-guide
* base16 https://github.com/chriskempson/base16-shell (tommorrow_night)
* https://github.com/multiplexd/brightlight
    * https://unix.stackexchange.com/questions/301724/xbacklight-not-working
* Iosevka font
* better-lockscreen
* xbacklight https://unix.stackexchange.com/questions/301724/xbacklight-not-working

### pop os setup
run 'bash popOsKeybindings.sh'
in keybindings change launch terminal and disable "launch and switch applications"


### polybar
```
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2

git clone https://github.com/jaagr/polybar.git

cd polybar && ./build.sh
```


```
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

