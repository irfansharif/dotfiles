set --export GOPATH $HOME/Software
set --export PATH $PATH $GOPATH/bin
set --export GITHUBPATH $GOPATH/src/github.com

set --export PATH $PATH $HOME/.local/bin
set --export PATH $PATH /usr/local/sbin /usr/sbin /sbin
set --export PATH $PATH /usr/local/bin /usr/bin /bin

bind \cc 'commandline ""'
