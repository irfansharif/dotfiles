# @irfansharif's dotfiles

A documented history of needlessly meddling about configuration files
hoping to save time lost via meddling about configuration files.

## Setup

Copy and run the following script to set up these dotfiles on a new macOS machine:

```sh
#!/usr/bin/env bash

# Install Homebrew if not present.
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install required packages.
brew install tmux fish neovim fd fzf autojump tree htop ripgrep golang gh coreutils graphviz cloc

# Install Oh My Fish.
if ! command -v omf &> /dev/null; then
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi
# Install theme.
omf install robbyrussell

# Clone dotfiles repo.
SRCTREE=${SRCTREE:-~/Software/src/github.com/irfansharif/dotfiles}
if [ ! -d "$SRCTREE" ]; then
  mkdir -p ~/Software/src/github.com/irfansharif
  git clone git@github.com:irfansharif/dotfiles.git $SRCTREE
fi

# Create symlinks.
ln -sf ${SRCTREE}/tmux/tmux.conf ~/.tmux.conf
ln -sf ${SRCTREE}/git/gitconfig ~/.gitconfig
ln -sf ${SRCTREE}/git/git-template ~/.git-template
ln -sf ${SRCTREE}/git/gitignore-global ~/.gitignore-global
ln -sf ${SRCTREE}/idea/ideavimrc ~/.ideavimrc

mkdir -p ~/.config
ln -sf ${SRCTREE}/nvim ~/.config/nvim
ln -sf ${SRCTREE}/ghostty ~/.config/ghostty
ln -sf ${SRCTREE}/fish ~/.config/fish
ln -sf ${SRCTREE}/bat ~/.config/bat
touch ~/.config/fish/custom.fish

echo "Setup complete!"
```

### Optional
- Install Powerline fonts for better terminal appearance (if needed):

  ```sh
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
  ```
