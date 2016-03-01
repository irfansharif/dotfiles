# General updates and system package installs
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f

# Essential package installations for fresh systems
# Adding repositories
sudo add-apt-repository ppa:flexiondotorg/albert
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update

# Single installation step
sudo apt-get install google-chrome-stable albert spotify-client
