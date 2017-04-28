# @irfansharif's dotfiles

A documented history of needlessly meddling about configuration files
hoping to save time lost via meddling about configuration files.

## Credit
- Friends, family & girlfriend for coexisting with me as I mumble and froth
  about the tao of tmux/vim or about 'being in the zone' or something

## Setup/autolinking
```sh
# Make appropriate backups for .tmux.conf, .vimrc, .gitconfig,
# ~/.config/fish, ~/.vim
git clone git@github.com:irfansharif/dotfiles.git /{dir}/dotfiles
ln -s /{dir}/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s /{dir}/dotfiles/vim/vimrc ~/.vimrc
ln -s /{dir}/dotfiles/vim/vim ~/.vim
ln -s /{dir}/dotfiles/config/fish/ ~/.config/fish
ln -s /{dir}/dotfiles/git/gitconfig ~/.gitconfig
```
