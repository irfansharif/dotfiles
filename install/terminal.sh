sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f

sudo apt-get install git-core vim zsh tree silversearcher-ag

sudo curl -L http://install.ohmyz.sh > ~/install.sh
sudo sh ~/install.sh
sudo wget -nocheck-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh
sudo chsh -s /bin/zsh
rm ~/install.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
