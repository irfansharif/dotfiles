# @irfansharif's dotfiles

A documented history of needlessly meddling about configuration files
hoping to save time lost via meddling about configuration files.

## Credit
- Friends, family & girlfriend for coexisting with me as I foam at mouth
  mumbling about the tao of tmux/vim or about 'being in the zone' or something

## Setup, Backup/Restore
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
  ln -sf ${SRCTREE}/config/fish/ ~/.config/fish
  ln -sf ${SRCTREE}/git/gitconfig ~/.gitconfig
  ln -sf ${SRCTREE}/git/git-template ~/.git-template
  ln -sf ${SRCTREE}/git/gitignore-global ~/.gitignore-global
  ln -sf ${SRCTREE}/misc/ctags ~/.ctags
  ln -sf ${SRCTREE}/vim/vimrc ~/.vimrc
  ln -sf ${SRCTREE}/vim/vim ~/.vim
}
```

```sh
# Make appropriate backups for .tmux.conf, .vimrc, .gitconfig,
# ~/.config/fish, ~/.vim, ~/.ctags
#
# TODO(irfansharif): Doesn't deep-copy through symlinks, only appropriate for
# original setup. Subsequent changes should be done via version control.
function backup {
  mkdir -p ~/.backup-dotfiles/.config

    mv ~/.config/fish ~/.backup-dotfiles/.config/fish
    mv ~/.tmux.conf ~/.backup-dotfiles/.tmux.conf
    mv ~/.gitconfig ~/.backup-dotfiles/.gitconfig
    mv ~/.ctags ~/.backup-dotfiles/.ctags
    mv ~/.vimrc ~/.backup-dotfiles/.vimrc
    mv ~/.vim ~/.backup-dotfiles/.vim
}

# Make appropriate restores for .tmux.conf, .vimrc, .gitconfig,
# ~/.config/fish, ~/.vim, ~/.ctags
#
# TODO(irfansharif): Doesn't deep-copy through symlinks, only appropriate for
# original setup. Subsequent changes should be done via version control.
function restore {
  if [ ! -f ~/.backup-dotfiles ]; then
    echo "Backup dir (~/.backup-dotfiles) not found"
      exit 1
      fi

      mv ~/.backup-dotfiles/.config/fish ~/.config/fish
      mv ~/.backup-dotfiles/.tmux.conf ~/.tmux.conf
      mv ~/.backup-dotfiles/.gitconfig ~/.gitconfig
      mv ~/.backup-dotfiles/.ctags ~/.ctags
      mv ~/.backup-dotfiles/.vimrc ~/.vimrc
      mv ~/.backup-dotfiles/.vim ~/.vim
}
```
