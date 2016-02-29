sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f

sudo apt-get install google-chrome-stable git-core vim zsh tree

sudo curl -L http://install.ohmyz.sh > ~/install.sh
sudo sh ~/install.sh
sudo wget -nocheck-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh
sudo chsh -s /bin/zsh
rm ~/install.sh
