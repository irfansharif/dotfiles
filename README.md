# @irfansharif's dotfiles

A documented history of needlessly meddling about configuration files
hoping to save time lost via meddling about configuration files.

## Setup
```sh
#!/usr/bin/env bash

function install {
  if [ -z "$GOPATH" ]; then
    echo "GOPATH unset; exiting"
    exit 1
  fi

  if [ -z "$SRCTREE" ]; then
    echo "SRCTREE unset; falling back to $GOPATH/src/github.com/irfansharif/dotfiles"
    SRCTREE=$GOPATH/src/github.com/irfansharif/dotfiles
  fi

  if [ ! -d "$SRCTREE" ] ; then
    git clone git@github.com:irfansharif/dotfiles.git $SRCTREE
  fi

  ln -sf ${SRCTREE}/tmux/tmux.conf ~/.tmux.conf
  ln -sf ${SRCTREE}/git/gitconfig ~/.gitconfig
  ln -sf ${SRCTREE}/git/git-template ~/.git-template
  ln -sf ${SRCTREE}/git/gitignore-global ~/.gitignore-global
  ln -sf ${SRCTREE}/nvim ~/.config/nvim
  ln -sf ${SRCTREE}/fish ~/.config/fish
  ln -sf ${SRCTREE}/bat ~/.config/bat
  
  # ln -sf ${SRCTREE}/misc/ctags ~/.ctags
}
```
