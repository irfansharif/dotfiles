set --export GOPATH $HOME/External
# set --export GOPATH $GOPATH $HOME/Software
set --export PATH $PATH $HOME/.local/bin
set --export PATH $PATH /usr/local/sbin /usr/sbin /sbin
set --export PATH $PATH /usr/local/bin /usr/bin /bin
set --export PATH $PATH $GOPATH/bin
set --export GITHUBPATH $HOME/Software/src/github.com

set -U EDITOR vim
bind \cc 'commandline ""'
