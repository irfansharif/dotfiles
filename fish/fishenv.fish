set --export PATH $PATH /usr/sbin /sbin /usr/local/bin /usr/bin /bin
set --export GOPATH $HOME/Software
set --export PATH $PATH $GOPATH/bin

set --export FZF_DEFAULT_OPTS \
  '--height 40% --layout=reverse --border=sharp' \
  '--info=hidden --prompt="    search: " --pointer=" =" --marker="- " +s' \
  '--color=16,gutter:-1,fg+:136,bg+:-1,prompt:64,marker:166,pointer:166 --multi'

set --export FZF_CTRL_T_COMMAND 'fd --type file --exclude .git --exclude pkg/ui --exclude vendor --exclude c-deps --exclude artifacts --follow'
set --export FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude artifacts'
set --export HOMEBREW_EDITOR nvim
