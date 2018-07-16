# .dotfiles
 
dotfiles

* bspwm
* polybar
* zsh
* vim



## Installation


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
