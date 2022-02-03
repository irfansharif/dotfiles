set --export GOROOT /usr/local/Cellar/go/1.17.2/libexec
set --export GOPATH $HOME/Software
set --export PATH $PATH /usr/sbin /sbin /usr/local/bin /usr/bin /bin $GOPATH/bin $GOROOT/bin $HOME/Bin

set --export FZF_DEFAULT_OPTS \
  '--height 40% --layout=reverse --border=sharp' \
  '--info=hidden --prompt="    search: " --pointer=" =" --marker="- " +s' \
  '--color=16,gutter:-1,fg+:136,bg+:-1,prompt:64,marker:166,pointer:166 --multi'

set --export FZF_CTRL_T_COMMAND 'fd --type file --exclude .git --exclude pkg/ui --exclude vendor --exclude c-deps --exclude artifacts --follow'
set --export FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude artifacts'
set --export HOMEBREW_EDITOR nvim

# set --erase LC_ALL 
