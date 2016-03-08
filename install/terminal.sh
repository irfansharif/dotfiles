sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f
sudo apt-get install git-core vim zsh tree tmux silversearcher-ag autojump

sudo curl -L http://install.ohmyz.sh > ~/install.sh
sudo sh ~/install.sh
sudo wget -nocheck-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh
sudo chsh -s /bin/zsh
rm ~/install.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git clone https://github.com/rking/ag.vim.git ~/.vim/bundle/ag
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-color-solarized
git clone git@github.com:terryma/vim-smooth-scroll.git ~/.vim/bundle/vim-smoll-scroll.git

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
